#' Topojson layer
#'
#' Add a topojson layer to a d3-carto-map
#' @param visible Should the layer be initially visible?
#' @export
topojson_layer <- function(carto, data, feature, file = NULL,
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
