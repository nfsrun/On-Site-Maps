//Based off of MSSQL test from https://docs.microsoft.com/en-us/azure/sql-database/sql-database-connect-query-nodejs

var Connection = require('tedious').Connection;
var Request = require('tedious').Request;

// Create connection to database
var config =
{
    userName: 'edhacksuser', 
    password: 'edforpresident2020!', 
    server: 'edhackssqlserver.database.windows.net', 
    options:
    {
        database: 'edhacks', 
        encrypt: true
    }
}
var connection = new Connection(config);

// Attempt to connect and execute queries if connection goes through
connection.on('connect', function(err)
    {
        if (err)
        {
            console.log(err)
        }
        else
        {
            queryDatabase()
        }
    }
);

function queryDatabase()
{
    console.log('Reading rows from the Table...');

    // Read all rows from table
<<<<<<< HEAD
	var request = new Request(
        "SELECT objectID FROM [dbo].[tblObject]"
=======
    var request = new Request(
        "SELECT tblCoord.long AS long, tblCoord.lat AS lat, tbl.locationTypeName AS locationTypeName FROM [dbo].[tblLocation] tblCoord"
            + "JOIN [dbo].[tblLocationType] tblLoc ON tblCoord.locationTypeID = tblLoc.locationTypeID"
	    + "JOIN [dbo].[tblLocationType] tlLoc ON tblCoord.locationTypeID = tblLoc.locationTypeID"
		,
>>>>>>> 6979d28f0c01bd827044d0fb355cca671b2d5fe7
        function(err, rowCount, rows)
        {
            console.log(rowCount + ' row(s) returned');
            process.exit();
        }
    );

    request.on('row', function(columns) {
        columns.forEach(function(column) {
            console.log("%s\t%s", column.metadata.colName, column.value);
        });
    });
<<<<<<< HEAD
	
	//check if all objects come in. 
	console.log(arr);
	connection.execSql(request);
	var i;
	
	// INSERT JSON CREATOR HERE
	
	var output = '{\n\t\"output\" : [';
	
	for(i = 0; i < arr.length; i++)
		output.concat("\n\t\t{\n");
		var first = true;
		var request1 = new Request(
			"SELECT tblLoc.locationTypeName AS LocationType, coord.long AS long, coord.lat AS lat  FROM [dbo].[tblCoordinate] coord "
				+ "JOIN [dbo].[tblObject] obj ON obj.objectID = coord.objectID "
				+ "JOIN [dbo].[tblLocationType] tblLoc ON obj.locationTypeID = tblLoc.locationTypeID "
				+ "WHERE obj.objectID = " + arr[i],
			function(err, rowCount, rows)
			{
				console.log(rowCount + ' row(s) returned');
				process.exit();
			}
		);
		request.on('row', function(columns) {
			columns.forEach(function(column) {
				if(column.metadata.colName == 'LocationType' && first == true){
					first = false;
					output.concat('\t\t\tLocationType: ');
					output.concat(column.value);
					output.concat(",\n");
				}else if(column.metadata.colName == 'lat'){
					output.concat('\t\t\tLat: ');
					output.concat(column.value);
					output.concat(",\n");
				}else{
					output.concat('\t\t\tLong: ');
					output.concat(column.value);
					output.concat("\n\t\t},");
				}
			})
		});
		connection.execSql(request1);
		output = output.substr(0,output.length - 1);
		output.concat("\n\t]\n}");
		
		//check if array output is as thought of
		console.log(output);
		return output;
	}
=======
    connection.execSql(request);
>>>>>>> 6979d28f0c01bd827044d0fb355cca671b2d5fe7
}