#' Tile layer
#'
#' Add a tile layer to a d3-carto-map
#'
#' @export
tile_layer <- function(carto, provider = "stamen", path = "toner",
                       label = "Base") {

  tile = list()
  tile$provider <- provider
  tile$path     <- path
  tile$label    <- label

  carto$x$tile <- tile

  carto

}

