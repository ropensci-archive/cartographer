library(rgdal)
library(dplyr)
library(devtools)
library(stringi)

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

countries_bbox <- df %>%
  filter(iso != "-99")

# Fix bad characters
mapL <- c("á","é","í","ó","ú","Á","É","Í","Ó","Ú","ñ","Ñ","ü","Ü","ç","ã","ô") %>%
  paste(collapse = "")
mapA <- c("a","e","i","o","u","A","E","I","O","U","n","N","u","U","c","a","o") %>%
  paste(collapse = "")
countries_bbox$name <- chartr(mapL, mapA, countries_bbox$name)

use_data(countries_bbox, overwrite = TRUE)

df <- data_frame(name = c("North America", "Asia", "Europe", "Africa",
                          "South America", "Oceania", "Antarctica"),
                 x_min = vector(mode = "numeric", length = 7),
                 x_max = vector(mode = "numeric", length = 7),
                 y_min = vector(mode = "numeric", length = 7),
                 y_max = vector(mode = "numeric", length = 7))

for(i in seq(nrow(df))) {
  name <- df$name[i]
  print(name)
  box <- bbox(countries[countries$CONTINENT == name, ])
  print(box)
  df[i, ]$x_min <- box[1]
  df[i, ]$x_max <- box[3]
  df[i, ]$y_min <- box[2]
  df[i, ]$y_max <- box[4]
}

continents_bbox <- df

use_data(continents_bbox, overwrite = TRUE)
