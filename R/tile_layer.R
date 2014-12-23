#' Tile layer
#'
#' Add a tile layer to a d3-carto-map.
#'
#' @param carto The map created by \code{cartographer()}.
#' @param provider The name of the provider of the map tiles. d3-carto-map
#'   currently supports \code{stamen} and \code{mapbox}.
#' @param path The string that identifies the type of tiles from the provider.
#'   Stamen's \href{http://maps.stamen.com/}{free tile options} include these:
#'   \itemize{ \item \code{toner} \item \code{toner-lite} \item
#'   \code{toner-hybrid} \item \code{toner-background} \item \code{terrain}
#'   \item \code{terrain-background} \item \code{watercolor} } Tile options from
#'   \href{https://www.mapbox.com/}{Mapbox} take the form of \code{user.id}, for
#'   example, \code{examples.map-zr0njcqy}. See some \href{http://a.tiles.mapbox.com/v3/mapbox/maps.html}{example Mapbox tiles}.
#' @param label The label for this layer on the layer selector.
#' @param visible Should the layer be initially visible?
#' @examples
#' cartographer(region = "Africa") %>%
#'   tile_layer() %>%
#'   tile_layer(provider = "mapbox", path = "mapbox.world-bright",
#'              label = "World Bright") %>%
#'   tile_layer(provider = "mapbox", path = "mapbox.natural-earth-1",
#'              label = "Natural Earth") %>%
#'   tile_layer(provider = "mapbox", path = "mapbox.geography-class",
#'              label = "Geography")
#' @seealso \code{\link{cartographer}}
#' @export
tile_layer <- function(carto, provider = c("stamen", "mapbox"),
                       path = "toner-lite", label = "Tiles",
                       visible = TRUE) {

  provider <- match.arg(provider)

  tile = list()
  tile$type     <- "tiles"
  tile$provider <- provider
  tile$path     <- path
  tile$label    <- label
  tile$visible  <- visible

  carto$x[[length(carto$x) +1]] <- tile

  carto

}

