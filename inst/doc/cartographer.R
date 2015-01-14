## ----, echo=FALSE--------------------------------------------------------
library(knitr)
opts_chunk$set(fig.width = 7.2, fig.height = 4.25)

## ----, message=FALSE-----------------------------------------------------
library(cartographer)
library(historydata)
library(dplyr)

## ------------------------------------------------------------------------
cartographer() %>%
  tile_layer()

## ------------------------------------------------------------------------
cartographer() %>%
  tile_layer(provider = "stamen", path = "toner-background")

## ------------------------------------------------------------------------
cartographer() %>%
  tile_layer(provider = "mapbox", path = "mapbox.world-bright")

## ------------------------------------------------------------------------
cartographer() %>%
  tile_layer(provider = "mapbox", path = "mapbox.geography-class")

## ------------------------------------------------------------------------
cartographer() %>%
  tile_layer(provider = "mapbox", path = "mapbox.natural-earth-hypso-bathy")

## ------------------------------------------------------------------------
data(catholic_dioceses)
catholic_dioceses

## ------------------------------------------------------------------------
cartographer(region = "United States") %>%
  tile_layer() %>%
  points_layer(data = catholic_dioceses, x = "long", y = "lat")

## ------------------------------------------------------------------------
archdioceses <- catholic_dioceses %>% filter(event == "metropolitan")
dioceses     <- catholic_dioceses %>% filter(event == "erected")

cartographer(region = "united states") %>%
  tile_layer() %>%
  points_layer(data = dioceses, color = "green", size = 4,
                label = "Dioceses") %>%
  points_layer(data = archdioceses, color = "purple", size = 8, opacity = 1,
                label = "Archdioceses")

## ------------------------------------------------------------------------
cartographer(region = "United States") %>%
  tile_layer() %>%
  points_layer(data = catholic_dioceses, cluster = TRUE)

## ------------------------------------------------------------------------
data(paulist_missions)

cartographer(region = "United States") %>%
  tile_layer() %>%
  points_layer(data = paulist_missions, radius_field = "confessions", size = 12,
               label = "Confessions") %>%
  points_layer(data = paulist_missions, radius_field = "converts", size = 12,
               color = "green", label = "Converts", visible = FALSE)

## ------------------------------------------------------------------------
land <- system.file("extdata", "land.geojson", package = "cartographer")
cartographer() %>%
  geojson_layer(file = land, label = "Land")

## ------------------------------------------------------------------------
us <- system.file("extdata", "us1853.topojson", package = "cartographer")
cartographer(region = "United States") %>%
  topojson_layer(file = us, feature = "us", label = "US 1853")

## ------------------------------------------------------------------------
library(USAboundaries)
us_sp <- us_boundaries(as.Date("1800-01-01"))
class(us_sp)

us_geo <- sp_to_geojson(us_sp)

cartographer(region = "United States") %>%
  tile_layer() %>%
  geojson_layer(data = us_geo, label = "US 1800", clickable = TRUE)

## ------------------------------------------------------------------------
cartographer(region = "Africa") %>%
  tile_layer()

## ------------------------------------------------------------------------
cartographer(region = "de") %>%
  tile_layer()

## ------------------------------------------------------------------------
cartographer(region = "United States") %>%
  tile_layer()

