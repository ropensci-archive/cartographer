#' Points layer
#'
#' Add a points layer to a d3-carto-map
#'
#' @param visible Should the layer be initially visible?
#' @param cluster If true, when the map is zoomed points will be clustered on a
#'   quadtree.
#'
#' @export
points_layer <- function(carto, data, x = "long", y = "lat", label = "Points",
                         color = "red", size = 4, clickable = TRUE,
                         visible = TRUE, cluster = FALSE) {

  points = list()
  points$type      <- "points"
  points$data      <- data
  points$x         <- x
  points$y         <- y
  points$label     <- label
  points$color     <- color
  points$size      <- size
  points$clickable <- clickable
  points$visible   <- visible
  points$cluster   <- cluster

  carto$x[[length(carto$x) +1]] <- points

  carto

}
