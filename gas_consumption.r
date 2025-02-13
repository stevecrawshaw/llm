remotes::install_github("mlverse/chattr")
pacman::p_load(tidyverse, janitor, glue, chattr)

chattr_app()


gas_data_raw  <- read_csv("https://opendata.westofengland-ca.gov.uk/api/explore/v2.1/catalog/datasets/gas_postcode_lep/exports/csv?lang=en&timezone=Europe%2FLondon&use_labels=true&delimiter=%2C")

gas_data_clean <- gas_data_raw %>%
  clean_names() |> 
  glimpse()

# q: Group by lower_super_output_area and sum the consumption for each area and get the minimum of the IMD?
# 

