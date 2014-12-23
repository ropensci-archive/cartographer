#' Topojson layer
#'
#' Add a topojson layer to a d3-carto-map
#'
#' @export
topojson_layer <- function(carto, data, file = NULL,
                           label = "TopoJSON", clickable = FALSE,
                           fill = "lightblue", stroke = "black",
                           opacity = 0.5) {

  layer = list()
  layer$type      <- "topojson"
  layer$data      <- data
  layer$label     <- label
  layer$clickable <- clickable
  layer$fill      <- fill
  layer$stroke    <- stroke
  layer$opacity   <- opacity

  carto$x[[length(carto$x) +1]] <- layer

  carto

}
