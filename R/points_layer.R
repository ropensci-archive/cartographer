#' Points layer
#'
#' Add a points layer to a d3-carto-map.
#'
#' @param carto The map created by \code{cartographer()}.
#' @param data A data frame with columns for the latitude and longitude in
#'   decimal degrees. It may also contain other columns to be used as
#'   properties.
#' @param x The name of the column in the data frame with the longitudes.
#' @param y The name of the column in the data frame with the latitudes.
#' @param label The label for this layer on the layer selector.
#' @param color The color of the points, either as a name recognized by a
#'   browser or as a hexadecimal string (e.g., \code{#4527f3}).
#' @param size The radius of the points.
#' @param clickable Controls whether a point can be clicked to show the
#'   properties in the data frame.
#' @param visible Should the layer be initially visible?
#' @param cluster If true, when the map is zoomed points will be clustered on a
#'   quadtree.
#' @examples
#' if(require(historydata)) {
#'   cartographer(region = "United States") %>%
#'     tile_layer() %>%
#'     points_layer(data = catholic_dioceses, x = "long", y = "lat",
#'                  color = "blue", label = "Dioceses")
#' }
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
