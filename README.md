## Cartographer: Interactive Maps for Data Exploration

Cartographer provides interactive maps in R Markdown documents or at the R console. These maps are suitable for data exploration. This package is an R wrapper around Elijah Meeks's [d3-carto-map](https://github.com/emeeks/d3-carto-map) and [d3.js](http://d3js.org/), using [htmlwidgets for R](http://www.htmlwidgets.org/).

Cartographer is under very early development.

### Installation

To install the development version from GitHub, first install [devtools](https://github.com/hadley/devtools). Then install Cartographer:

```
devtools::install_github("lmullen/cartographer", build_vignettes = TRUE)
```

### Basic use

Cartographer maps are composed using a series of functions that add point, tile, or polygon layers and control map options like colors, sizes, and zoom. For more explanation, see the [package vignette online](http://lincolnmullen.com/research/cartographer/) or in R by running `vignette("cartographer")`. Below is the code for and a screenshot of a sample map.

```
cartographer(region = "united states") %>%
  tile_layer() %>%
  points_layer(data = dioceses, color = "green", size = 4,
                label = "Dioceses") %>%
  points_layer(data = archdioceses, color = "purple", size = 8, opacity = 1,
                label = "Archdioceses")
```

![Screenshot of cartographer map](https://raw.githubusercontent.com/lmullen/cartographer/master/inst/readme-screenshot.png)

### License

This code is released under the [MIT License](http://lmullen.mit-license.org/). The included JavaScript libraries are used under the terms of their own licenses. See the [directories](https://github.com/lmullen/cartographer/tree/master/inst/htmlwidgets/lib) in `inst/htmlwidgets/lib/` for their licenses.
