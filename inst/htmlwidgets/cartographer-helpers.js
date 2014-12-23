function parseLayers(arr, map) {
  for (var i = 0; i < arr.length; i++)
  switch(arr[i].type) {
    case "points":
      addPoints(arr[i], map);
      break;
    case "tiles":
      addTiles(arr[i], map);
      break;
    case "topojson":
      addTopojson(arr[i], map);
      break;
    case "options":
      enactOptions(arr[i], map);
      break;
  }
}

function enactOptions(layer, map) {
    map.zoomTo(layer.bbox, "latlong", 0.9);
}

function addTiles(layer, map) {
  var tiles = d3.carto.layer.tile();

  tiles
  .tileType(layer.provider)
  .path(layer.path)
  .label(layer.label);

  map.addCartoLayer(tiles);
}

function addPoints(layer, map) {
  var points = d3.carto.layer.xyArray();

  points
  .features(HTMLWidgets.dataframeToD3(layer.data))
  .label(layer.label)
  .renderMode("svg")
  .clickableFeatures(layer.clickable)
  .cssClass("point")
  .markerSize(layer.size)
  .x(layer.x)
  .y(layer.y)
  .on("load", function() {
    points.g().selectAll(".point")
      .style("fill", layer.color)
      .style("fill-opacity", "0.5")
      .style("stroke", "black");
  })

  map.addCartoLayer(points);
}

function addTopojson(layer, map) {
  var topo = d3.carto.layer.featureArray();
  layer.data = JSON.parse(layer.data);

  topo
  .features(topojson.feature(layer.data,
                             layer.data.objects.us).features)
  .label(layer.label)
  .renderMode("svg")
  .clickableFeatures(layer.clickable)
  .cssClass("topojson")
  .on("load", function() {
    topo.g().selectAll(".topojson")
      .style("fill", layer.fill)
      .style("fill-opacity", layer.opacity)
      .style("stroke", layer.stroke);
  });

  map.addCartoLayer(topo);
}
