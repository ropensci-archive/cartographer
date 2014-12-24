#' Convert a spatial data object to a GeoJSON string
#'
#' Convert an R spatial polygons object to a GeoJSON string that can be used in
#' \code{\link{geojson_layer}}. The spatial classes are provided by the
#' \code{sp} package.
#'
#' @param sp A \code{SpatialPolygonsDataFrame}.
#' @return A string containing unparsed GeoJSON.
#' @note This function will write a GeoJSON file to the temporary directory
#'   created by R, but this file will be deleted when the R session ends.
#' @examples
#' if(require(USAboundaries)) {
#'   # Boundaries of the United States of America in 1800
#'   us <- us_boundaries(as.Date("1800-01-01"))
#'   us_geojson <- sp_to_geojson(us)
#'
#'   cartographer(region = "United States") %>%
#'     geojson_layer(data = us_geojson, clickable = TRUE, label = "US 1800")
#' }
#' @export
sp_to_geojson <- function(sp) {
  assert_that(is(sp, "SpatialPolygonsDataFrame"))
  file <- tempfile()
  writeOGR(sp, dsn = file, layer = "geo", driver = "GeoJSON")
  read_file(file)
}
