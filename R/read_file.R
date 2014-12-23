# Read a TopoJSON or GeoJSON file as a string
read_file <- function(fn) {
  readChar(fn, nchars = file.info(fn)$size)
}
