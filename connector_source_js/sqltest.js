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
    var request = new Request(
        "SELECT tblCoord.long AS long, tblCoord.lat AS lat, tbl.locationTypeName AS locationTypeName FROM [dbo].[tblLocation] tblCoord"
            + "JOIN [dbo].[tblLocationType] tblLoc ON tblCoord.locationTypeID = tblLoc.locationTypeID"
	    + "JOIN [dbo].[tblLocationType] tblLoc ON tblCoord.locationTypeID = tblLoc.locationTypeID"
		,
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
    connection.execSql(request);
}