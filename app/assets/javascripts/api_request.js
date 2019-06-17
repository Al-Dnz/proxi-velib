console.log("Hello from api_request.js");

const apiURL = "http://api.citybik.es/v2/networks/velib";
var stations = gon.stations ;
parseFloatCoord();

// console.log("STATIONS HERE -->");
// console.log(stations);
var proxiStations ;
init(gon.thp_location, stations);


function getStations(gon_stations)
{
  stations = gon_stations;
  parseFloatCoord()
  console.log("GET STATIONS->");
  console.log(stations);
}


function init(location,datas) {
  proxiStations = [];

      datas.forEach(function(element)
      {
        element.distance = orthonromicDistance(element, location);
        if (orthonromicDistance(element, location) < 1)
        {
          proxiStations.push(element)
        }
      });

      proxiStations.sort(function(a, b) {return a.distance - b.distance}).filter(station =>station.vacant_bikes > 0).slice(0, 5).forEach(function(station) {displayProxiStations(station)});
      // console.log("array from init function -->");
      // console.log(datas.sort(function(a, b) {return a.distance - b.distance}).slice(0, 5))

}

function orthonromicDistance(station, location) {
  const r = 6378.14;
  const precision = 10
  x1 = deg2rad(location.latitude);
  x2 = deg2rad(station.latitude);
  y1 = deg2rad(location.longitude);
  y2 = deg2rad(station.longitude);
  var dlat = x2 - x1;
  var dlong = y2 - y1;
  var a = Math.sin(dlat / 2) * Math.sin(dlat / 2) + Math.cos(x1) * Math.cos(x2) * Math.sin(dlong / 2) * Math.sin(dlong / 2);
  var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
  var d = Math.round(1000 * r * c) / 1000;
  return d;
}

function deg2rad(degrees) {
  var pi = Math.PI;
  return degrees * (pi / 180);
}


function displayProxiStations(stationObject)
  {
    var tableBody = document.getElementById('table-content');
    var td1 = document.createElement("TD");
    var td3 = document.createElement("TD");
    var td4 = document.createElement("TD");
    var tr = document.createElement("TR");
    td1.innerHTML = stationObject.name;
    td3.innerHTML = stationObject.vacant_bikes;
    td4.innerHTML = stationObject.distance*1000 + " m";
    tr.appendChild(td1);
    tr.appendChild(td3);
    tr.appendChild(td4);
    tableBody.appendChild(tr);

    var marker = L.marker([stationObject.latitude, stationObject.longitude])
    marker.bindPopup(stationObject.name);
    markers.addLayer(marker);
    map.addLayer(markers);
  }

function refreshMethod(){
  console.log("REFRESH !");
  gon.watch( "gon_stations" , getStations );
  //gon.clear;
  // stations = gon.stations;
  var tableBody = document.getElementById('table-content');

  markers.clearLayers();
  map.off();
  map.remove();
  createMap(centerPoint, thpMarker);
  tableBody.innerHTML = "";
  newStations = [];

  stations.forEach(function(element) {
    if (proxiStations.some(e => e.id === element.id))
    {
      var newStation = proxiStations.find(function(e) {return e.id === element.id;});
      //console.log("nouvelle stations :"+ newStation.name);
      newStation.vacant_bikes = element.vacant_bikes;
      newStations.push(newStation);
    }
  });

  newStations.sort(function(a, b) {return a.distance - b.distance});
  newStations.filter(station =>station.vacant_bikes > 0).slice(0, 5).forEach(function(station) {displayProxiStations(station)})
  setMainMarker(thpMarker);
  //gon.unwatch( "gon_stations" , getStations );

}

function parseFloatCoord()
{
  stations.forEach(function(element)
  {
    element.latitude = parseFloat(element.latitude);
    element.longitude = parseFloat(element.longitude);
  })

}
