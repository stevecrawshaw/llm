pacman::p_load(openair, tidyverse)

# Load the data

data <- importAURN(site = c("BRS8", "BR11"), year = 2019:2024, pollutant = c("no2", "nox", "no", "pm10", "pm2.5"), verbose = TRUE)

# group the data by site and year and get annual mean NO2

data |> glimpse()

data |> 
  group_by(site, year = year(date)) |> 
  summarise(mean_no2 = mean(no2, na.rm = TRUE)) |>
  ungroup() |>
  ggplot(aes(x = year, y = mean_no2, color = site)) +
  geom_line() +
  geom_point() +
  labs(title = quickText("Annual mean NO2 concentration at Bristol sites"),
       x = "Year",
       y = quickText("NO2 (µg/m³)"),
       color = "Site") +
  theme_minimal()
