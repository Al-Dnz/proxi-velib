console.log("hello from main_map.js");
var map = L.map('main-map').setView([51.505, -0.09], 13);
 L.tileLayer('http://{s}.tile.thunderforest.com/landscape/{z}/{x}/{y}.png',{maxZoom :100}).addTo(map);
