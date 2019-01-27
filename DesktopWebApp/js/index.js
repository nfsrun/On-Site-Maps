// var string = "[2143214,1234132],[1234141,12343214]";
// split string by commas
// split string by 

var socket = io.connect('http://localhost:3000');



// *********** Mapping Stuff ******************8
// Query for minimum and maximum x, get median and set center coordinate
var mymap = L.map('mapid').setView([49.262, -123.245], 17);

L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emYycXBndHRqcmZ3N3gifQ.rJcFIG214AriISLbB6B5aw', {
    maxZoom: 18,
    attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, ' +
        '<a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, ' +
        'Imagery © <a href="https://www.mapbox.com/">Mapbox</a>',
    id: 'mapbox.streets'
}).addTo(mymap);

socket.on('news', function (data) {
    console.log(data);

    for (let i = 0; i < data.length; i += 2) {
        var lat = data[i] + 11.4763;
        var long = data[i + 1] - 0.83845;
        console.log(lat);
        console.log(long);
        var circle0 = L.circle([lat, long], {
            color: 'red',
            fillColor: 'red',
            fillOpacity: 1,
            radius: 3}).addTo(mymap);
    }
    socket.emit('my other event', {my: 'data'});
    console.log("RECEIVE");
});

// var circle0 = L.circle([49.2625, -123.2452], {
//     color: 'red',
//     fillColor: 'red',
//     fillOpacity: 1,
//     radius: 5}).addTo(mymap);


// var circle1 = L.circle([49.26045, -123.2482], {
//     color: 'red',
//     fillColor: 'red',
//     fillOpacity: 1,
//     radius: 5}).addTo(mymap);


// var circle2 = L.circle([49.26262, -123.24685], {
//     color: 'red',
//     fillColor: 'red',
//     fillOpacity: 1,
//     radius: 5}).addTo(mymap);

// var circle3 = L.circle([49.26261, -123.2428], {
//     color: 'red',
//     fillColor: 'red',
//     fillOpacity: 1,
//     radius: 5}).addTo(mymap);

// var latlngs = [
//     [49.2625, -123.2562],
//     [49.26045, -123.2482],
//     [49.26261, -123.2428]
// ];

// var polyLine = L.polyline(latlngs).addTo(mymap);

// var polygon = L.polygon(latlngs).addTo(mymap);
