#' Create a cartographer map
#'
#' This function creates a new instance of a d3-carto-map and sets its most
#' basic options. By itself the function does not create any layers on the map.
#'
#' @param region The region to which the map should be centered. This region can
#'   be one of several types. Passing a
#'   \href{http://en.wikipedia.org/wiki/ISO_3166-1_alpha-2}{two-digit ISO
#'   country code} will center the map on that country. The string \code{"United
#'   States"} will center the map on the continental United States of America.
#'   You can also use the names of continents. The region is case insensitive.
#' @param bbox Instead of a region, you can center the map on a bounding box.
#'   The bounding box be specified in decimal degrees of latitude and longitude
#'   and should have the following format: \code{list(c(long1, lat1), c(long2,
#'   lat2))}
#' @param width The width of the map in pixels.
#' @param height The height of the map in pixels.
#'
#' @examples
#' if(require(historydata)) {
#'   cartographer(region = "United States") %>%
#'     tile_layer() %>%
#'     points_layer(catholic_dioceses, x = "long", y = "lat")
#' }
#'
#' @seealso \code{\link{points_layer}}, \code{\link{tile_layer}},
#'   \code{\link{topojson_layer}}
#' @export
cartographer <- function(region = NULL, bbox = NULL,
                         width = NULL, height = NULL) {

  if(!is.null(region)) {
    if(tolower(region) == "united states")
      bbox <- list(c(-124.848974, 24.396308), c(-66.885444, 49.384358))
    else if(tolower(region) %in% tolower(continents_bbox$name))
      bbox <- get_bbox(region, type = "continent")
    else
      bbox <- get_bbox(region)
  } else {
    bbox <- list(c(-160, 70), c(160, -70))
  }

  options        <- list()
  options$type   <- "options"
  options$bbox   <- bbox

  # forward options using x
  x = list(options)

  # create widget
  htmlwidgets::createWidget(
    name = 'cartographer',
    x,
    width = width,
    height = height,
    package = 'cartographer'
  )
}

#' Widget output function for use in Shiny
#'
#' @param outputId ID used for the output.
#' @param width Width of the output.
#' @param height Height of the output.
#'
#' @export
cartographerOutput <- function(outputId, width = '100%', height = '400px'){
  shinyWidgetOutput(outputId, 'cartographer', width, height, package = 'cartographer')
}

#' Widget render function for use in Shiny
#'
#' @param expr Expression
#' @param env Environment
#' @param quoted Quoted
#'
#' @export
renderCartographer <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  shinyRenderWidget(expr, cartographerOutput, env, quoted = TRUE)
}
