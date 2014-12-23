# Get bounding box from ISO country code or continent name
get_bbox <- function(name, type = c("country", "continent")) {
  type <- match.arg(type)
  if(type == "country") {
    cf <- tolower(countries_bbox$iso) == tolower(name)
    box <- countries_bbox[cf, ]
  } else {
    cf <- tolower(continents_bbox$name) == tolower(name)
    box <- continents_bbox[cf, ]
  }
  coord1 <- c(box$x_min[1], box$y_max[1])
  coord2 <- c(box$x_max[1], box$y_min[1])
  list(coord1, coord2)
}
