# Load the knitr package
library(quarto)
library(knitr)

# Predefined list of input files
file_list <- c(
  "_02-01_iq.qmd",
  "_02-02_academics.qmd",
  "_02-03_verbal.qmd",
  "_02-04_spatial.qmd",
  "_02-05_memory.qmd",
  "_02-06_executive.qmd",
  "_02-07_motor.qmd",
  "_02-09_adhd_child.qmd",
  "_02-10_emotion_child.qmd",
  "_03-00_sirf.qmd"
)

# Loop through the list to knit each file
for (file in file_list) {
  cat("Knitting file:", file, "\n")
  quarto::quarto_render(file, output_format = "typst")
}

quarto::quarto_render("_02-05_memory.qmd", output_format = "typst")
quarto::quarto_render("_02-09_adhd_child.qmd", output_format = "typst")
quarto::quarto_render("_03-00_sirf.qmd", output_format = "typst")

quarto::quarto_render("Felix.qmd", output_format = "neurotyp-pediatric-typst")

# chattr
library(chattr)
chattr_use("gpt4-o")
chattr_app()

# PDE ---------------------------------------------------------------------

library("PDE")
PDE_analyzer_i()

# I'm happy to help!

# It looks like the original code is a shell script, and the user wants to rewrite it in R. Here is the rewritten code:

files <- c(
  "_02-01_iq_text.qmd",
  "_02-02_academics_text.qmd",
  "_02-03_verbal_text.qmd",
  "_02-04_spatial_text.qmd",
  "_02-05_memory_text.qmd",
  "_02-06_executive_text.qmd",
  "_02-07_motor_text.qmd",
  "_02-09_adhd_child_text_parent.qmd",
  "_02-09_adhd_child_text_self.qmd",
  "_02-10_emotion_child_text_parent.qmd"
)

sink("sirf_summary.txt")
for (file in files) {
  cat("== ", file, " ==\n")
  cat(readLines(file), "\n\n")
}
sink()
