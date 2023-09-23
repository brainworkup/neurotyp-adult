# Load the necessary library
library(purrr)

# Patient file
patient_file <- "Biggie.qmd"

# Create a vector of file names
file_names <- c(
  "_02-01_iq.qmd",
  # "_02-02_academics.qmd",
  "_02-03_verbal.qmd",
  "_02-04_spatial.qmd",
  "_02-05_executive.qmd",
  "_02-06_memory.qmd",
  # "_02-07_motor.qmd",
  # "_02-08_social.qmd",
  "_02-09_adhd.qmd",
  "_02-10_emotion.qmd",
  # "_02-11_adaptive.qmd",
  "_03-00_sirf.qmd"
)

# Create a list of parameters
params <- list(
  patient = "Biggie",
  first_name = "Biggie",
  last_name = "Smalls",
  dob = "1999-01-01",
  sex = "male",
  age = 31,
  education = 17,
  handedness = "right",
  doe1 = "2023-01-01",
  doe2 = "2023-02-01",
  doe3 = "2023-03-01",
  dx1 = "attention-deficit/hyperactivity disorder (ADHD)",
  dx2 = "anxiety",
  dx3 = "depression",
  referral = "Dr. Dre",
  observer = "Mrs. Smalls",
  observer_relation = "mother",
  he_she = "he",
  he_she_cap = "He",
  his_her = "his",
  his_her_cap = "His",
  him_her = "him",
  him_her_cap = "Him"
)

# Use `walk` to loop through each file and run `quarto_render`
walk(file_names, ~ quarto::quarto_render(
  input = .,
  execute_params = params
))

# Maybe before this try to render the project
# Render the report
quarto::quarto_render(
  input = patient_file,
  execute_params = params
)
