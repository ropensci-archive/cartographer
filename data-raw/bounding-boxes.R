library(rgdal)
library(dplyr)
library(devtools)

zip <- "data-raw/countries.zip"
if(!file.exists(zip)) {
  ne <- "http://www.naturalearthdata.com/http//www.naturalearthdata.com/download/10m/cultural/ne_10m_admin_0_countries.zip"
  download.file(ne, zip)
}
unzip(zip, exdir = "data-raw")

countries <- readOGR("data-raw/", "ne_10m_admin_0_countries")

l <- length(countries)
df <- data_frame(iso = vector(mode = "character", length = l),
                 name = vector(mode = "character", length = l),
                 x_min = vector(mode = "numeric", length = l),
                 x_max = vector(mode = "numeric", length = l),
                 y_min = vector(mode = "numeric", length = l),
                 y_max = vector(mode = "numeric", length = l))

for(i in seq(l)) {
  country <- countries@data$NAME[i] %>% as.character()
  iso <- countries@data$ISO_A2[i] %>% as.character()
  box <- bbox(countries[i,])
  df[i, ]$iso   <- iso
  df[i, ]$name  <- country
  df[i, ]$x_min <- box[1]
  df[i, ]$x_max <- box[3]
  df[i, ]$y_min <- box[2]
  df[i, ]$y_max <- box[4]
}

world_bounding_boxes <- df %>%
  filter(iso != "-99")

use_data(world_bounding_boxes, overwrite = TRUE)
