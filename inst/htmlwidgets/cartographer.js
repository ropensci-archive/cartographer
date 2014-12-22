HTMLWidgets.widget({

  name: 'cartographer',

  type: 'output',

  initialize: function(el, width, height) {

    return {
      // TODO: add instance fields as required
    }

  },

  renderValue: function(el, x, instance) {

    x.data = HTMLWidgets.dataframeToD3(x.data);

    var div = d3.select("#" + el.id)
      .append("div")
      .style("width", "100%")
      .style("height", "100%")
      .style("position", "relative")
      .classed("map", true);

    var map = d3.carto.map();
    div.call(map);

    var tiles = d3.carto.layer.tile();
    tiles.tileType("stamen").path("toner").label("Base");

    var points = d3.carto.layer.xyArray();
    points
    .features(x.data)
    .label("Points")
    .renderMode("svg")
    .clickableFeatures(true)
    .cssClass("point")
    .markerSize(5)
    .x("long")
    .y("lat")


    map.addCartoLayer(tiles)
       .addCartoLayer(points);

  },

  resize: function(el, width, height, instance) {

  }

});
