HTMLWidgets.widget({

  name: 'cartographer',

  type: 'output',

  initialize: function(el, width, height) {

    return {
      // TODO: add instance fields as required
    }

  },

  renderValue: function(el, x, instance) {

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

    map.addCartoLayer(tiles);

  },

  resize: function(el, width, height, instance) {

  }

});
