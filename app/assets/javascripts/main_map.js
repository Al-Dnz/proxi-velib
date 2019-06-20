//console.log("hello from main_map.js");
var map;
var centerPoint = [gon.thp_location.latitude, gon.thp_location.longitude]
var thpMarker ;
var genericMarker ;
var markers;

function createMap(coordinates , boolean)
{
  map = L.map('main-map').setView(coordinates, 16);
  L.tileLayer('https://{s}.tile.openstreetmap.se/hydda/full/{z}/{x}/{y}.png',{maxZoom :100}).addTo(map);
  markers = L.layerGroup();

  thpIcon = L.icon({
      iconUrl: 'https://i2.wp.com/laboate.com/next3/wp-content/uploads/2018/05/hacking-project.png?fit=240%2C239',
      iconSize: [35, 35],
      iconAnchor: [22, 38],
      popupAnchor: [-3, -76],
      shadowSize: [68, 95],
      shadowAnchor: [22, 94]
      });

  if (boolean == true)
  {thpMarker = L.marker(coordinates, {icon: thpIcon})}
  else
  {genericMarker =  L.circle(coordinates , {radius: 10 , opacity: 1 ,color: "red"} );}
}

function setMainMarker()
{
  if (thpMarker){
   thpMarker.addTo(map);
  }
  else{
   genericMarker.addTo(map);
  }
}

createMap(centerPoint, true);
setMainMarker();
