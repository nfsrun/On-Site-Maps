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

// Calls to SQL server

const Connection = require('tedious').Connection;

const Request = require('tedious').Request;

const config = {
    userName: 'edhacksuser',
    password: 'edforpresident2020!',
    server: 'edhackssqlserver.database.windows.net',
    options: {
        database: 'edhacks',
		
        encrypt: true
    }
}

let connection = new Connection(config);

var outputArr = [];
connection.on('connect', function(err) {
    if (err) {
        // console.log(err)
    } else {
        console.log('Successful connect');
        outputArr = queryDatabase();
    }
});

async function queryDatabase() {
	var arr = [];
	var arr1 = [];
    // Read all rows from table
	var request = new Request(
        // "SELECT * FROM tblData",
        "SELECT LAT, LONG FROM tblCoordinate",
        function(err, rowCount, rows)
        {
        }
    );

    connection.execSql(request);
	var arr = await new Promise(function(resolve, reject) {
        request.on('row', function(columns) {
            columns.forEach(function(column) {
                arr.push(column.value);
            });
            resolve(arr);
        });
    });

    io.on('connection', function(socket) {
        // console.log(arr);
        socket.emit('news', arr);
        socket.on('my other event', function (data) {
            // console.log(data);
        });
        console.log('Connection')
    });


    return outputArr;
}

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