#| label: data-g
xfun::pkg_attach2(c("readr", "dplyr", "bwu"))
patient <- "~/neurocog"
g <- bwu::gpluck_get_index_scores(patient = patient)

#| label: data-iq
#| tidy: true
# which csv file to use
pheno <- "iq"

if (pheno == "adhd" || pheno == "emotion") {
  csv <- "neurobehav.csv"
} else {
  csv <- "neurocog.csv"
}

# read data
file_path <- file.path(csv)
data <- readr::read_csv(file_path)

#| label: filter-iq
# filter by broad domain
domain <- "Intelligence/General Ability"

data <- data |>
  dplyr::filter(domain == !!domain) |>
  dplyr::filter(!is.na(percentile))

# filter by scale
filter_file <- c(
  "Cognitive Efficiency",
  "Cognitive Proficiency (CPI)",
  "Cognitive Proficiency Index",
  "Cognitive Proficiency",
  "Crystallized Knowledge Index",
  "Crystallized Knowledge",
  "Fluid Reasoning (FRI)",
  "Fluid Reasoning Index",
  "Fluid Reasoning",
  "Full Scale (FSIQ)",
  "General Ability (GAI)",
  "General Ability Index",
  "General Ability",
  "General Intelligence",
  "NAB Attention Index",
  "NAB Executive Functions Index",
  "NAB Language Index",
  "NAB Memory Index",
  "NAB Spatial Index",
  "NAB Total Index",
  "Nonverbal (NVI)",
  "Perceptual Reasoning (PRI)",
  "Processing Speed (PSI)",
  "Processing Speed Index",
  "Processing Speed",
  "RBANS Total Index",
  "Test of Premorbid Functioning",
  "TOPF Standard Score",
  "Verbal Comprehension (VCI)",
  "Visual Spatial (VSI)",
  "Vocabulary Acquisition (VAI)",
  "Word Reading",
  "Working Memory (WMI)",
  "Working Memory Index",
  "Working Memory"
)
data <- dplyr::filter(data, scale %in% filter_file)

#| label: text-iq
#| cache: true
xfun::pkg_attach2(c("glue", "purrr", "dplyr", "epoxy"))

# Sorting the data by percentile and removing duplicates
data_text <-
  data %>%
  dplyr::arrange(dplyr::desc(percentile)) %>%
  dplyr::distinct(.keep_all = FALSE)

# Convert the data to text and append to the file
cat(paste0(data_text$result),
  file = "_02_iq_raw.qmd",
  sep = "\n",
  append = TRUE
)

#| label: qtbl-iq
# GT table
xfun::pkg_attach2(c("gt", "dplyr", "glue", "webshot2", "gtExtras", "bwu"))

# source note
source_note <- gt::md("*Note:* Index scores have a mean of 100 and a standard deviation of 15.")

# run fc
table_iq <- bwu::tbl_gt(
  data,
  table_name = "table_iq",
  source_note = source_note,
  title = NULL
)
table_iq

# save
gt::gtsave(table_iq, glue("table_iq", ".png"), expand = 10)
gt::gtsave(table_iq, glue("table_iq", ".pdf"), expand = 10)

#| label: fig-iq
#| eval: true
#| fig-cap: "*General Ability* is the overall skill to reason, solve problems, and gain useful knowledge. *Crystallized Knowledge* involves understanding the world through language and reasoning. *Fluid Reasoning* is the logical analysis and solution of new problems, identifying underlying patterns, and applying logic."

# load packages
xfun::pkg_attach2(c(
  "gt", "tidyverse", "glue", "webshot2", "ggplot2", "ggthemes",
  "scales", "bwu"
))

# more filtering for plots
data_dotplot <- dplyr::filter(
  data,
  scale %in% c("General Ability", "Crystallized Knowledge", "Fluid Reasoning")
)

# will need to change these for each domain
fig_iq <- bwu::dotplot(
  data = data_dotplot,
  x = data_dotplot$z_mean_narrow,
  y = data_dotplot$narrow,
  fill = x
)
fig_iq

ggplot2::ggsave("fig_iq.png")
ggplot2::ggsave("fig_iq.pdf")

#| label: tbl-md-typ-iq
#| eval: true
#| tbl-cap: "General Cognitive Ability"

# markdown table; change label if want to use
tbl_md <- bwu::tbl_md_typ(data[, c(2, 4, 5, 6)])
tbl_md

#| label: csv-iq
iq <- data[, c(2, 4, 5, 6)]
readr::write_csv(iq, "iq.csv", col_names = FALSE)
