# Load necessary libraries
library(tidyverse)
pacman::p_load(recipes, tidymodels)
# Read in the data
data <- read_csv("https://opendata.westofengland-ca.gov.uk/api/explore/v2.1/catalog/datasets/gas_postcode_lep/exports/csv?lang=en&timezone=Europe%2FLondon&use_labels=true&delimiter=%2C") |> 
  clean_names()

# Explore the data
glimpse(data)

data_recipe <- recipe(total_consumption ~ ., data = data) %>%
  step_dummy(all_nominal_predictors()) %>%
  step_center(all_predictors()) |> 
  step_scale(all_predictors)

model_spec <- linear_reg() %>%
  set_engine("lm")

# Create the workflow
workflow <- workflow() %>%
  add_recipe(data_recipe) %>%
  add_model(model_spec)

# Fit the model
set.seed(123)
model_fit <- fit(workflow, data = data)

# Summary of model fit
model_summary <- broom::tidy(model_fitprint(model_summary)

# Model performance
predictions <- predict(model_fit, new_data = data)
metrics <- yardstick::metrics(data, truth = total_consumption, estimate = .pred)
print)

# Visualizing the resultsggplot(data, aes(x = total_consumption, y = predictions$.pred)) +
  geom(alpha = 0.5) +
  geom_abline(color = "") +
  labs(x = "Actual Total Consumption", y = "Predicted Total Consumption") +
  theme_minimal
