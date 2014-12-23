HTMLWidgets.widget({

  name: 'cartographer',

  type: 'output',

  initialize: function(el, width, height) {

    return {
      // TODO: add instance fields as required
    }

  },

  renderValue: function(el, x, instance) {

    // Debugging
    global = x;
    console.log(global);

    var div = d3.select("#" + el.id)
      .append("div")
      .style("width", "100%")
      .style("height", "100%")
      .style("position", "relative")
      .classed("map", true);

    var map = d3.carto.map();
    div.call(map);

    parseLayers(x, map);

  },

  resize: function(el, width, height, instance) {

  }

});
