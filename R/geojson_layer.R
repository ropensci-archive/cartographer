#' GeoJSON layer
#'
#' Add a \href{http://geojson.org/}{GeoJSON} layer to a d3-carto-map.
#'
#' @param carto The map created by \code{cartographer()}.
#' @param data A GeoJSON string (unparsed). The GeoJSON can be provided
#'   through the \code{file} parameter instead.
#' @param file The path to a GeoJSON file.
#' @param visible Should the layer be initially visible?
#' @param clickable Controls whether a point can be clicked to show the
#'   properties in the data frame.
#' @param fill The fill color of the GeoJSON polygons, either as a name
#'   recognized by a browser or as a hexadecimal string (e.g., \code{#4527f3}).
#' @param stroke The stroke color of the GeoJSON polygons.
#' @param opacity The opacity of the GeoJSON polygons.
#' @param label The label for this layer on the layer selector.
#' @examples
#' # Path to a sample GeoJSON file
#' land <- system.file("extdata", "land.geojson", package = "cartographer")
#' cartographer() %>%
#'   geojson_layer(file = land, label = "Land")
#' @export
geojson_layer <- function(carto, data, file = NULL,
                          label = "GeoJSON", clickable = FALSE,
                          fill = "lightblue", stroke = "black",
                          opacity = 0.5, visible = TRUE) {

  if(missing(data) & !is.null(file))
     data <- read_file(file)

  layer = list()
  layer$type      <- "geojson"
  layer$data      <- data
  layer$label     <- label
  layer$clickable <- clickable
  layer$fill      <- fill
  layer$stroke    <- stroke
  layer$opacity   <- opacity
  layer$visible   <- visible

  carto$x[[length(carto$x) +1]] <- layer

  carto

}
