library(tidyverse)
library(vroom)

# #' Prepare Data for Analysis
# #'
# #' This function prepares data for analysis by reading a CSV file, filtering the data based on the specified domains and scales,
# #' selecting relevant columns, and writing the filtered data to a new CSV file.
# #'
# #' @param domains A character vector of domains to filter the data by.
# #' @param pheno A string representing the phenotype to use as the base name for the output CSV file.
# #' @param scales A character vector of scales to filter the data by.
# #' @param type A string representing the name of the input CSV file. Default is "neurocog.csv".
# #'
# #' @return NULL (invisible) after writing the filtered data to a CSV file.
# #' @export
# #'
# #' @examples
# #' # Example usage:
# #' domains <- c("Memory")
# #' pheno <- "memory"
# #' scales <- c("Scale1", "Scale2")
# #' prepare_data(domains, pheno, scales)
# prepare_data <- function(domains, pheno, scales, type = "neurocog.csv") {
#   # Check if required arguments are provided
#   if (missing(domains) || missing(pheno) || missing(scales)) {
#     stop("All arguments (domains, pheno, scales) must be provided.")
#   }

#   # Read the CSV file into a data frame
#   data <- vroom::vroom(type)

#   # Ensure required columns are present in the data
#   required_columns <- c(
#     "test",
#     "test_name",
#     "scale",
#     "raw_score",
#     "score",
#     "ci_95",
#     "percentile",
#     "range",
#     "domain",
#     "subdomain",
#     "narrow",
#     "pass",
#     "verbal",
#     "timed",
#     "description",
#     "result",
#     "z",
#     "z_mean_domain",
#     "z_sd_domain",
#     "z_mean_subdomain",
#     "z_sd_subdomain",
#     "z_mean_narrow",
#     "z_sd_narrow",
#     "z_mean_pass",
#     "z_sd_pass",
#     "z_mean_verbal",
#     "z_sd_verbal",
#     "z_mean_timed",
#     "z_sd_timed"
#   )

#   if (!all(required_columns %in% colnames(data))) {
#     stop("The data does not contain all required columns.")
#   }

#   # Filter data by domains and remove rows with missing 'z_mean_domain' values
#   data <- data %>%
#     dplyr::filter(domain %in% domains, !is.na(z_mean_domain))

#   # Select relevant columns
#   data <- data %>%
#     dplyr::select(
#       test,
#       test_name,
#       scale,
#       raw_score,
#       score,
#       ci_95,
#       percentile,
#       range,
#       domain,
#       subdomain,
#       narrow,
#       pass,
#       verbal,
#       timed,
#       result,
#       z,
#       z_mean_domain,
#       z_sd_domain,
#       z_mean_subdomain,
#       z_sd_subdomain,
#       z_mean_narrow,
#       z_sd_narrow,
#       z_mean_pass,
#       z_sd_pass,
#       z_mean_verbal,
#       z_sd_verbal,
#       z_mean_timed,
#       z_sd_timed
#     )

#   # Filter data by scales
#   data <- data %>%
#     dplyr::filter(scale %in% scales)

#   # Write the filtered data to a CSV file with the phenotype name
#   readr::write_csv(
#     data,
#     paste0(pheno, ".csv"),
#     na = "",
#     col_names = TRUE,
#     append = FALSE
#   )

#   # Return NULL invisibly to avoid printing the data frame
#   invisible(NULL)
# }

# # Define the variables for domains, phenotype, and scales of interest
# domains <- c("General Cognitive Ability")
# pheno <- "iq"
# scales <- c(
#   "Auditory Working Memory (AWMI)",
#   "Cognitive Proficiency (CPI)",
#   "Crystallized Knowledge",
#   "Fluid Reasoning (FRI)",
#   "Fluid Reasoning",
#   "Full Scale (FSIQ)",
#   "Full Scale IQ (FSIQ)",
#   "General Ability (GAI)",
#   "General Ability",
#   "General Intelligence",
#   "Global Neurocognitive Index (G)",
#   "NAB Attention Index",
#   "NAB Executive Functions Index",
#   "NAB Language Index",
#   "NAB Memory Index",
#   "NAB Spatial Index",
#   "NAB Total Index",
#   "Nonverbal (NVI)",
#   "Perceptual Reasoning (PRI)",
#   "Perceptual Reasoning",
#   "Processing Speed (PSI)",
#   "Processing Speed",
#   "RBANS Total Index",
#   "Test of Premorbid Functioning",
#   "TOPF Standard Score",
#   "Total NAB Index (T-NAB)",
#   "Verbal Comprehension (VCI)",
#   "Verbal Comprehension",
#   "Visual Perception/Construction",
#   "Visual Spatial (VSI)",
#   "Vocabulary Acquisition (VAI)",
#   "Word Reading",
#   "Working Memory (WMI)",
#   "Working Memory",
#   "Attention Index (ATT)",
#   "Language Index (LAN)",
#   "Spatial Index (SPT)",
#   "Memory Index (MEM)",
#   "Executive Functions Index (EXE)"
# )

# # Call the function with the specified domains, phenotype, and scales
# data <- prepare_data(domains, pheno, scales, type = "neurocog.csv")

# Define the variables for domains, phenotype, and scales of interest
library(tidyverse)
library(vroom)

#' Prepare Data for Analysis
#'
#' This function prepares data for analysis by reading a CSV file, filtering the data based on the specified domains and scales,
#' selecting relevant columns, and writing the filtered data to a new CSV file.
#'
#' @param domains A character vector of domains to filter the data by.
#' @param pheno A string representing the phenotype to use as the base name for the output CSV file.
#' @param scales A character vector of scales to filter the data by.
#' @param type A string representing the name of the input CSV file. Default is "neurocog.csv".
#'
#' @return A data frame containing the filtered data.
#' @export
#'
#' @examples
#' # Example usage:
#' domains <- c("Memory")
#' pheno <- "memory"
#' scales <- c("Scale1", "Scale2")
#' prepare_data(domains, pheno, scales)
prepare_data <- function(domains, pheno, scales, type = "neurocog.csv") {
  # Check if required arguments are provided
  if (missing(domains) || missing(pheno) || missing(scales)) {
    stop("All arguments (domains, pheno, scales) must be provided.")
  }

  # Read the CSV file into a data frame
  # Use show_col_types = FALSE to suppress the parsing issues warning
  data <- vroom::vroom(type, show_col_types = FALSE)

  # Ensure required columns are present in the data
  required_columns <- c(
    "test",
    "test_name",
    "scale",
    "raw_score",
    "score",
    "ci_95",
    "percentile",
    "range",
    "domain",
    "subdomain",
    "narrow",
    "pass",
    "verbal",
    "timed",
    "result",
    "z",
    "z_mean_domain",
    "z_sd_domain",
    "z_mean_subdomain",
    "z_sd_subdomain",
    "z_mean_narrow",
    "z_sd_narrow",
    "z_mean_pass",
    "z_sd_pass",
    "z_mean_verbal",
    "z_sd_verbal",
    "z_mean_timed",
    "z_sd_timed"
  )

  if (!all(required_columns %in% colnames(data))) {
    stop("The data does not contain all required columns.")
  }

  # Filter data by domains and remove rows with missing 'z_mean_domain' values
  data <- data %>%
    dplyr::filter(domain %in% domains, !is.na(z_mean_domain))

  # Select relevant columns
  data <- data %>%
    dplyr::select(
      test,
      test_name,
      scale,
      raw_score,
      score,
      ci_95,
      percentile,
      range,
      domain,
      subdomain,
      narrow,
      pass,
      verbal,
      timed,
      result,
      z,
      z_mean_domain,
      z_sd_domain,
      z_mean_subdomain,
      z_sd_subdomain,
      z_mean_narrow,
      z_sd_narrow,
      z_mean_pass,
      z_sd_pass,
      z_mean_verbal,
      z_sd_verbal,
      z_mean_timed,
      z_sd_timed
    )

  # Filter data by scales
  data <- data %>%
    dplyr::filter(scale %in% scales)

  # Write the filtered data to a CSV file with the phenotype name
  readr::write_csv(
    data,
    paste0(pheno, ".csv"),
    na = "",
    col_names = TRUE,
    append = FALSE
  )

  # Return the filtered data
  return(data)
}

# Define the variables for domains, phenotype, and scales of interest
domains <- c("General Cognitive Ability")
pheno <- "iq"
scales <- c(
  "Auditory Working Memory (AWMI)",
  "Cognitive Proficiency (CPI)",
  "Crystallized Knowledge",
  "Fluid Reasoning (FRI)",
  "Fluid Reasoning",
  "Full Scale (FSIQ)",
  "Full Scale IQ (FSIQ)",
  "General Ability (GAI)",
  "General Ability",
  "General Intelligence",
  "Global Neurocognitive Index (G)",
  "NAB Attention Index",
  "NAB Executive Functions Index",
  "NAB Language Index",
  "NAB Memory Index",
  "NAB Spatial Index",
  "NAB Total Index",
  "Nonverbal (NVI)",
  "Perceptual Reasoning (PRI)",
  "Perceptual Reasoning",
  "Processing Speed (PSI)",
  "Processing Speed",
  "RBANS Total Index",
  "Test of Premorbid Functioning",
  "TOPF Standard Score",
  "Total NAB Index (T-NAB)",
  "Verbal Comprehension (VCI)",
  "Verbal Comprehension",
  "Visual Perception/Construction",
  "Visual Spatial (VSI)",
  "Vocabulary Acquisition (VAI)",
  "Word Reading",
  "Working Memory (WMI)",
  "Working Memory",
  "Attention Index (ATT)",
  "Language Index (LAN)",
  "Spatial Index (SPT)",
  "Memory Index (MEM)",
  "Executive Functions Index (EXE)"
)

# Define grouped phenotypes
grp_pheno <- list(
  scaled_score = c(
    "WAIS-IV",
    "D-KEFS",
    "NEPSY-2",
    "WISC-5",
    "WISC-V",
    "WPPSI-IV",
    "RBANS"
  ),
  standard_score = c(
    "NAB",
    "NAB-S",
    "WISC-5",
    "WISC-V",
    "WAIS-IV",
    "WPPSI-IV",
    "WASI-II",
    "RBANS",
    "NAB Executive Functions",
    "NAB Attention"
  ),
  t_score = c(
    "NAB",
    "NAB-S",
    "NIH EXAMINER",
    "Trail Making Test",
    "Daily Living",
    "NAB Executive Functions",
    "NAB Attention"
  )
)

# Define scales to keep for visualization
scales_to_keep <- c(
  "Auditory Working Memory (AWMI)",
  "Cognitive Proficiency (CPI)",
  "Crystallized Knowledge",
  "Fluid Reasoning (FRI)",
  "Fluid Reasoning",
  "Full Scale (FSIQ)",
  "Full Scale IQ (FSIQ)",
  "General Ability (GAI)",
  "General Ability"
)

# Call the function with the specified domains, phenotype, and scales
data_prepared <- prepare_data(domains, pheno, scales)

# Second function (unchanged from previous code)
library(ggplot2)
library(gt)

#' Visualize Data with Table and Dot Plot
#'
#' This function generates a table and a dot plot for a given dataset based on specified phenotypes and domains.
#' The table is created using `bwu::tbl_gt`, and the dot plot is created using `bwu::dotplot`.
#'
#' @param data A data frame containing the data to be visualized. Must contain columns `scale`, `x`, and `y`.
#' @param scales_to_keep A vector of scales to filter the data by.
#' @param pheno A string representing the phenotype of interest.
#' @param domain A string representing the domain of interest.
#' @param grp_pheno A list containing grouped phenotypic data. Default is NULL.
#' @param x A string representing the name of the x variable. This should match a column name in the data.
#' @param y A string representing the name of the y variable. This should match a column name in the data.
#'
#' @return A list containing two elements: the table visualization (from `tbl_gt`) and the dot plot visualization (from `dotplot`).
#' @export
#'
#' @examples
#' # Example usage:
#' data <- data.frame(scale = c("A", "B", "C"), x = rnorm(3), y = rnorm(3))
#' scales_to_keep <- c("A", "B")
#' pheno <- "example_pheno"
#' domain <- "example_domain"
#' visualize_data(data, scales_to_keep, pheno, domain)
visualize_data <- function(
  data,
  scales_to_keep,
  pheno,
  domain,
  grp_pheno = NULL,
  x = "x",
  y = "y"
) {
  # Check if required arguments are missing
  if (
    missing(data) ||
      missing(scales_to_keep) ||
      missing(pheno) ||
      missing(domain)
  ) {
    stop("All arguments (data, scales_to_keep, pheno, domain) must be provided")
  }

  # Ensure that data contains the necessary columns
  if (!all(c("scale", x, y) %in% colnames(data))) {
    stop("Data must contain 'scale', 'x', and 'y' columns")
  }

  # Filter data based on scales_to_keep
  data_tbl <- data %>%
    dplyr::filter(scale %in% scales_to_keep)

  # Table visualization parameters
  table_name <- paste0("table_", pheno)
  vertical_padding <- 0
  multiline <- TRUE

  # Notes and source information
  fn_scaled_score <- gt::md(
    "Score = Scaled score (Mean = 10 [50th‰], SD ± 3 [16th‰, 84th‰])"
  )
  fn_standard_score <- gt::md(
    "Score = Index score (Mean = 100 [50th‰], SD ± 15 [16th‰, 84th‰])"
  )
  fn_t_score <- gt::md(
    "Score = T score (Mean = 50 [50th‰], SD ± 10 [16th‰, 84th‰])"
  )
  fn_z_score <- gt::md(
    "Score = z-score (Mean = 0 [50th‰], SD ± 1 [16th‰, 84th‰])"
  )
  source_note <- gt::md(
    "Score = _T_ score (Mean = 50 [50th‰], SD ± 10 [16th‰, 84th‰])"
  )

  # Create the table using bwu::tbl_gt
  tbl_gt <- bwu::tbl_gt(
    data = data_tbl,
    pheno = pheno,
    table_name = table_name,
    source_note = source_note,
    fn_scaled_score = fn_scaled_score,
    fn_standard_score = fn_standard_score,
    fn_t_score = fn_t_score,
    fn_z_score = fn_z_score,
    grp_scaled_score = if (!is.null(grp_pheno)) grp_pheno[["scaled_score"]] else
      NULL,
    grp_standard_score = if (!is.null(grp_pheno))
      grp_pheno[["standard_score"]] else NULL,
    grp_t_score = if (!is.null(grp_pheno)) grp_pheno[["t_score"]] else NULL,
    dynamic_grp = grp_pheno,
    vertical_padding = vertical_padding,
    multiline = multiline,
    na.rm = TRUE
  )

  # Dot plot visualization
  filename <- paste0("fig_", pheno, "_", domain, ".svg")
  colors <- NULL
  return_plot <- TRUE

  # Extract x and y values
  x_values <- data[[x]]
  y_values <- data[[y]]

  # Create the dot plot using bwu::dotplot
  dotplot <- bwu::dotplot(
    data = data,
    x = x_values,
    y = y_values,
    colors = colors,
    return_plot = return_plot,
    filename = filename,
    na.rm = TRUE
  )

  # Return both visualizations as a list
  list(tbl_gt = tbl_gt, dotplot = dotplot)
}

# Correct usage of the visualize_data function
data_vis <- visualize_data(
  data = data_prepared,
  scales_to_keep = scales_to_keep,
  pheno = pheno,
  domain = "General Cognitive Ability",
  grp_pheno = grp_pheno
)

processed_data <- prepare_data(domains, pheno, scales)
domain_name <- "General Cognitive Ability"
visualization_results <- visualize_data(
  data = processed_data,
  scales_to_keep = scales_to_keep,
  pheno = pheno,
  domain = domain_name
)
