const thp_logo = "https://images.crunchbase.com/image/upload/c_lpad,h_170,w_170,f_auto,b_white,q_auto:eco,dpr_1/bn6lwjqsl2d8fpffdf0o"
var map;
var centerPoint = [gon.thp_location.latitude, gon.thp_location.longitude]
var thpMarker ;
var genericMarker ;
var markers;
var currentLayer;


function changeMapLayer() {
  var value = document.getElementById("layerSelect").value;
  var index  = parseInt(value);
  map.removeLayer(currentLayer);
  var newLayer =  L.tileLayer(map_layer_arr[index],{maxZoom :100})
  newLayer.addTo(map);
}

function createLayerSelectField()
{
var array = map_layer_arr;
var div = document.getElementById("selectLayerField")
var selectList = document.createElement("select");
selectList.id = "layerSelect";

for (var i = 0; i < array.length; i++) {
  var option = document.createElement("option");
  option.value = i;
  option.text = array[i];
  selectList.appendChild(option);
}

selectList.setAttribute( "onchange", "changeMapLayer()");
var labelForSelectList = document.createElement("label");
labelForSelectList.setAttribute( "for", "layerSelect");
labelForSelectList.innerHTML = "Map Layer"
div.appendChild(labelForSelectList);
div.appendChild(selectList);
}


const map_layer_arr = [
  "https://{s}.tile.openstreetmap.fr/hot/{z}/{x}/{y}.png",
  "https://{s}.tile.opentopomap.org/{z}/{x}/{y}.png",
  'https://{s}.tile.openstreetmap.fr/osmfr/{z}/{x}/{y}.png',
  'https://{s}.tile-cyclosm.openstreetmap.fr/cyclosm/{z}/{x}/{y}.png',
  ]

function createMap(coordinates , boolean)
{
  map = L.map('main-map').setView(coordinates, 16);
  currentLayer = L.tileLayer(map_layer_arr[0],{maxZoom :100})
  currentLayer.addTo(map);
  markers = L.layerGroup();

  thpIcon = L.icon({
      iconUrl: thp_logo,
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
createLayerSelectField();
