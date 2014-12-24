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
#' @param size The radius of the points. If the parameter \code{radius_field} is
#'   set so that the points are scaled to a variable in \code{data}, then the
#'   \code{size} parameter controls the maximum size of the points.
#' @param radius_field The name of a numeric field in the data frame passed to
#'   \code{data}. This field will be used to scale the points. The domain of the
#'   scale will run from 0 to the maximum value in the \code{radius_field}; the
#'   range will run from 0 to the value in \code{size}.
#' @param radius_function A
#'   \href{https://github.com/mbostock/d3/wiki/Quantitative-Scales}{D3
#'   quantitative scale function} to control the radius of the points.
#' @param clickable Controls whether a point can be clicked to show the
#'   properties in the data frame.
#' @param visible Should the layer be initially visible?
#' @param cluster If true, when the map is zoomed points will be clustered on a
#'   quadtree. If the points are clustered, arguments that control the size of
#'   points will be disregarded.
#' @param opacity The opacity of points on the map: a number between 0 and 1.
#' @examples
#' if(require(historydata)) {
#'   cartographer(region = "United States") %>%
#'     tile_layer() %>%
#'     points_layer(data = paulist_missions, x = "long", y = "lat",
#'                  color = "blue", label = "Missions",
#'                  radius_field = "confessions", size = 8)
#' }
#' @export
points_layer <- function(carto, data, x = "long", y = "lat", label = "Points",
  color = "red", size = 4, radius_field = NULL, clickable = TRUE,
  visible = TRUE, cluster = FALSE, opacity = 0.5,
  radius_function = "d3.scale.sqrt().domain([0, layer.radius_domain]).range([0, layer.size])") {

  # Calculate the maximum for the domain of the radius scale function
  if(!is.null(radius_field))
    radius_domain <- data[radius_field] %>% max(na.rm = TRUE)
  else
    radius_domain <- NULL

  points = list()
  points$type            <- "points"
  points$data            <- data
  points$x               <- x
  points$y               <- y
  points$label           <- label
  points$color           <- color
  points$size            <- size
  points$clickable       <- clickable
  points$visible         <- visible
  points$cluster         <- cluster
  points$radius_domain   <- radius_domain
  points$radius_field    <- radius_field
  points$radius_function <- radius_function
  points$opacity         <- opacity

  carto$x[[length(carto$x) +1]] <- points

  carto

}
