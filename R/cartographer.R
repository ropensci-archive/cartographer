#' <Add Title>
#'
#' <Add Description>
#'
#' @import htmlwidgets
#'
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
#' @export
cartographerOutput <- function(outputId, width = '100%', height = '400px'){
  shinyWidgetOutput(outputId, 'cartographer', width, height, package = 'cartographer')
}

#' Widget render function for use in Shiny
#'
#' @export
renderCartographer <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  shinyRenderWidget(expr, cartographerOutput, env, quoted = TRUE)
}
