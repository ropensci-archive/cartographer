# Hide variables from R CMD check
if(getRversion() >= "2.15.1") {
  utils::globalVariables(c("countries_bbox", "continents_bbox"))
}
