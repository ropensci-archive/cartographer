#' Points layer
#'
#' Add a points layer to a d3-carto-map
#'
#' @export
points_layer <- function(carto, data, x = "long", y = "lat", label = "Points",
                         color = "red", size = 4, clickable = TRUE) {

  points = list()
  points$data      <- data
  points$x         <- x
  points$y         <- y
  points$label     <- label
  points$color     <- color
  points$size      <- size
  points$clickable <- clickable

  carto$x$points  <- points

  carto

}
