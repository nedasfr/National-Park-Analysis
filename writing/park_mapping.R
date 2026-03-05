library(sf)
library(tigris)
library(tidyverse)
library(broom)
library(purrr)
library(ggthemes)
library(scales)
library(maps)

st_layers("data/nps_boundary/")

us_states <- states(cb = TRUE) %>% 
  filter(STUSPS %in% c(state.abb, "DC"))

us_shifted <- shift_geometry(us_states)

us_shifted <- st_transform(us_shifted, 4326)

park_boundaries <- read_sf("data/nps_boundary/",
                           layer = "nps_boundary")

parks_shifted <- shift_geometry(park_boundaries)

parks_shifted <- st_transform(parks_shifted, 4326)


head(park_boundaries)

deaths <- read_csv("data/mortality_clean.csv") %>%
  group_by(park) %>%
  summarise(total_deaths = n(), .groups = "drop")

parks_deaths <- parks_shifted %>%
  left_join(deaths,
            by = c("UNIT_NAME" = "park"))

parks_with_deaths <- parks_deaths %>%
  filter(!is.na(total_deaths))

top10_parks <- parks_with_deaths %>%
  slice_max(total_deaths, n = 10)

top10_points <- st_point_on_surface(top10_parks)



ggplot() + 
  geom_sf(data = us_shifted, color = "white",
          fill = "darkgrey", alpha = 0.5) +
  geom_sf(data = parks_shifted, color = "red",
          alpha = 0.8) +
  geom_sf(data = top10_points, aes(size = total_deaths),
          color = "black", fill = "orange", shape = 21, alpha = 0.7) +
  scale_size_continuous(name = "Total deaths", range = c(3, 10)) +
  coord_sf(xlim = c(-130, -65), ylim = c(20, 50), expand = FALSE)









