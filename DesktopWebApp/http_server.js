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

// Azure server connection/setup
// my stuff
// const endpoint = "";
// const masterkey = "";
// const client = new CosmosClient({endpoint: endpoint, auth: {masterkey: masterkey} });


// const databaseId = "";

// kevin's stuff
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

connection.on('connect', function(err) {
    if (err) {
        console.log(err)
    } else {
        console.log('Successful connect');
        queryDatabase();
    }
});

async function queryDatabase()
{
	var arr = [];
	var arr1 = [];
    // Read all rows from table
	var request = new Request(
        "SELECT objectID FROM [dbo].[tblObject]",
        function(err, rowCount, rows)
        {
            console.log(rowCount + ' row(s) returned');
            process.exit();
        }
    );
	
	request.on('row', function(columns) {
        columns.forEach(function(column) {
            arr.push(column.value);
            console.log(arr);
        });
    });
	connection.execSql(request);
	//check if all objects come in. 

    var i;
	
	// INSERT JSON CREATOR HERE
	
	// var output = '{\n\t\"output\" : [';
	
	// for(i = 0; i < arr.length; i++) {
	// 	output.concat("\n\t\t{\n");
	// 	var first = true;
	// 	var request1 = new Request(
	// 		"SELECT tblLoc.locationTypeName AS LocationType, coord.long AS long, coord.lat AS lat  FROM [dbo].[tblCoordinate] coord "
	// 			+ "JOIN [dbo].[tblObject] obj ON obj.objectID = coord.objectID "
	// 			+ "JOIN [dbo].[tblLocationType] tblLoc ON obj.locationTypeID = tblLoc.locationTypeID "
	// 			+ "WHERE obj.objectID = " + arr[i],
	// 		function(err, rowCount, rows)
	// 		{
	// 			console.log(rowCount + ' row(s) returned');
	// 			process.exit();
	// 		}
	// 	);
	// 	request.on('row', function(columns) {
	// 		columns.forEach(function(column) {
	// 			if(column.metadata.colName == 'LocationType' && first == true){
	// 				first = false;
	// 				output.concat('\t\t\tLocationType: ');
	// 				output.concat(column.value);
	// 				output.concat(",\n");
	// 			}else if(column.metadata.colName == 'lat'){
	// 				output.concat('\t\t\tLat: ');
	// 				output.concat(column.value);
	// 				output.concat(",\n");
	// 			}else{
	// 				output.concat('\t\t\tLong: ');
	// 				output.concat(column.value);
	// 				output.concat("\n\t\t},");
	// 			}
	// 		})
	// 	});
	// 	connection.execSql(request1);
	// 	output = output.substr(0,output.length - 1);
	// 	output.concat("\n\t]\n}");
		
    //     //check if array output is as thought of
	// 	console.log(output);
	// 	return output;
	// }
}

// Transfer data to and render front end

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