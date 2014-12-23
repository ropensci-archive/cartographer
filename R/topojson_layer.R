#' Topojson layer
#'
#' Add a \href{https://github.com/mbostock/topojson}{topojson} layer to a
#' d3-carto-map.
#'
#' @param carto The map created by \code{cartographer()}.
#' @param data A topojson string (unparsed). The topojson can be provided
#'   through the \code{file} parameter instead.
#' @param file The path to a topojson file.
#' @param feature The name of the feature object to be mapped.
#' @param visible Should the layer be initially visible?
#' @param clickable Controls whether a point can be clicked to show the
#'   properties in the data frame.
#' @param fill The fill color of the topojson polygons, either as a name
#'   recognized by a browser or as a hexadecimal string (e.g., \code{#4527f3}).
#' @param stroke The stroke color of the topojson polygons.
#' @param opacity The opacity of the topojson polygons.
#' @param label The label for this layer on the layer selector.
#' @examples
#' # Path to a sample topojson file
#' us1853 <- system.file("extdata", "us1853.topojson", package = "cartographer")
#' cartographer(region = "United States") %>%
#'   topojson_layer(file = us1853, feature = "us", label = "US 1853")
#' @export
topojson_layer <- function(carto, data, file = NULL, feature,
                           label = "TopoJSON", clickable = FALSE,
                           fill = "lightblue", stroke = "black",
                           opacity = 0.5, visible = TRUE) {

  if(missing(data) & !is.null(file))
     data <- read_file(file)

  layer = list()
  layer$type      <- "topojson"
  layer$data      <- data
  layer$label     <- label
  layer$clickable <- clickable
  layer$fill      <- fill
  layer$stroke    <- stroke
  layer$opacity   <- opacity
  layer$feature   <- feature
  layer$visible   <- visible

  carto$x[[length(carto$x) +1]] <- layer

  carto

}
