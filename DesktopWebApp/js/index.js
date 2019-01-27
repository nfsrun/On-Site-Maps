
var mymap = L.map('mapid').setView([49.262, -123.245], 17);

L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emYycXBndHRqcmZ3N3gifQ.rJcFIG214AriISLbB6B5aw', {
    maxZoom: 18,
    attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, ' +
        '<a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, ' +
        'Imagery © <a href="https://www.mapbox.com/">Mapbox</a>',
    id: 'mapbox.streets'
}).addTo(mymap);

var circle0 = L.circle([49.2625, -123.2452], {
    color: 'red',
    fillColor: 'red',
    fillOpacity: 1,
    radius: 5}).addTo(mymap);


var circle1 = L.circle([49.26045, -123.2482], {
    color: 'red',
    fillColor: 'red',
    fillOpacity: 1,
    radius: 5}).addTo(mymap);


var circle2 = L.circle([49.26262, -123.24685], {
    color: 'red',
    fillColor: 'red',
    fillOpacity: 1,
    radius: 5}).addTo(mymap);

var circle3 = L.circle([49.26261, -123.2428], {
    color: 'red',
    fillColor: 'red',
    fillOpacity: 1,
    radius: 5}).addTo(mymap);

console.log("Hello");