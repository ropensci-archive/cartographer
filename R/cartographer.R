#' <Add Title>
#'
#' <Add Description>
#'
#' @import htmlwidgets
#'
#' @export
cartographer <- function(message, width = NULL, height = NULL) {

  # forward options using x
  x = list(
    message = message
  )

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
