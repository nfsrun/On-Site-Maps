// server side (NodeJS) code
// socket
// express
const path = require('path');

const express = require('express');
const http =  require('http');
const router = express.Router();

const app = express();
const server = http.createServer(app);
const io = require('socket.io')(server);

const hostname = '127.0.0.1';
const port = 3000;

io.on('connection', function(socket) {
    socket.emit('news', [{lat: 456}, {long: 123}]);
    socket.on('my other event', function (data) {
        console.log(data);
    });
    console.log('Connection')
});

app.get('/', function(req, res) {
    res.sendFile(path.join(__dirname + '/index.html'));
});

app.get('/js/index.js', function(req, res) {
    res.sendFile(path.join(__dirname + '/js/index.js'));
});

app.use('/', router);
server.listen(port, function() {
    console.log('Server started on port 3000...');
});