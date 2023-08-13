make_g_csv <- function(patient <- "~/neuropsychology/neurotyp") {
  g <- bwu::gpluck_get_index_scores(patient = patient)
}

read_data <- function(pheno) {
  if (pheno == "adhd" || pheno == "emotion") {
    csv <- "neurobehav.csv"
  } else {
    csv <- "neurocog.csv"
  }
  file_path <- file.path(csv)
  data <- readr::read_csv(file_path)
  return(data)
}

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

filter_domain <- function(data, domain, filter_file = filter_file) {
  # filter by broad domain
  data <-
    dplyr::filter(data, domain == !!domain) |>
    dplyr::filter(!is.na(percentile))

  # filter by scale
  filter_file <- filter_file

  return(dplyr::filter(data, scale %in% filter_file))
}

#| label: text-iq
#| cache: true
# R function that takes in data and sorts it by percentile
flatten_scale_text <- function(data, file = "_02_iq_raw.qmd") {
  library(glue)
  library(purrr)
  library(dplyr)

  # Sorting the data by percentile and removing duplicates
  data_text <- data |>
    dplyr::arrange(dplyr::desc(percentile)) |>
    dplyr::distinct(.keep_all = FALSE)

  # Convert the data to text and append to the file
  cat(
    paste0(data_text$result),
    file = file,
    sep = "\n",
    append = TRUE
  )
}

#| label: qtbl-iq
index_score <- "*Note:* Index scores have a mean of 100 and a standard deviation of 15."
table_name <- "table_iq"
make_tbl_gt <- function(data, table_name, pheno) {
  # source note
  source_note <-
    gt::md(index_score)

  # make gt table
  gt_table <- bwu::tbl_gt(data,
    table_name = table_name,
    source_note = source_note,
    title = NULL
  )
  gt_table
  # save
  gt::gtsave(gt_table, glue("table_{pheno}", ".png"), expand = 10)
  gt::gtsave(gt_table, glue("table_{pheno}", ".pdf"), expand = 10)
}


#| label: fig-iq
#| fig-cap: "*General Ability* is the overall skill to reason, solve problems, and gain useful knowledge. *Crystallized Knowledge* involves understanding the world through language and reasoning. *Fluid Reasoning* is the logical analysis and solution of new problems, identifying underlying patterns, and applying logic."
make_fig <- function(data, x = data_dotplot$z_mean_narrow, y = data_dotplot$narrow, pheno) {
  # load packages
  xfun::pkg_attach(c(
    "gt",
    "dplyr",
    "glue",
    "webshot2",
    "ggplot2",
    "ggthemes",
    "scales",
    "bwu"
  ))

  # more filtering for plots
  data_dotplot <- dplyr::filter(
    data,
    scale %in% c(
      "General Ability",
      "Crystallized Knowledge",
      "Fluid Reasoning"
    )
  )

  # will need to change these for each domain
  fig <- bwu::dotplot(
    data = data_dotplot,
    x = x,
    y = y,
    fill = x
  )
  fig
  ggplot2::ggsave(glue::glue("fig_{pheno}.png"))
  ggplot2::ggsave(glue::glue("fig_{pheno}.pdf"))
}

#| label: tbl-md-typ-iq
#| eval: false
#| tbl-cap: "General Cognitive Ability"
make_tbl_md_typ <- function(data) {
  tbl_md <- bwu::tbl_md_typ(data[, c(2, 4, 5, 6)])
  return(tbl_md)
}

#| label: csv-iq
#| eval: false
# R function that takes in data and writes it to a csv file for Typst tables
write_domain_csv <- function(data, pheno) {
  pheno <- data[, c(2, 4, 5, 6)]
  readr::write_csv(pheno, glue::glue("{pheno}.csv"), col_names = FALSE)
}
