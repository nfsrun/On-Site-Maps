import pyodbc
server = 'edhackssqlserver.database.windows.net'
database = 'edhacks'
username = 'edhacksuser'
password = 'edforpresident2020!'
driver= '{ODBC Driver 13 for SQL Server}'

cnxn = pyodbc.connect('DRIVER='+driver+';PORT=1433;SERVER='+server+';PORT=1443;DATABASE='+database+';UID='+username+';PWD='+ password)
cursor = cnxn.cursor()


from flask import Flask
from flask_restful import Api, Resource, reqparse
import pandas as pd

app = Flask(__name__)
api = Api(app)

cursor.execute("select o.objectID, ot.objectTypeName, lt.locationTypeName, c.long, c.lat from tblObject o JOIN tblObjectType ot on o.objectID = ot.objectTypeID JOIN tblCoordinate c on o.objectID = c.objectID JOIN tblLocationType lt on o.locationTypeID = lt.locationTypeID")
row = cursor.fetchone()

allObjects = pd.DataFrame(columns=["objectID", "objectTypeName", "locationTypeName", "long", "lat"])

while row:
    currObject = {}
    currObject["objectID"] = row[0]
    currObject["objectTypeName"] = row[1]
    currObject["locationTypeName"] = row[2]
    currObject["long"] = str(row[3])
    currObject["lat"] = str(row[4])
    allObjects = allObjects.append(currObject, ignore_index=True)
    row = cursor.fetchone()

objectIDs = allObjects["objectID"].unique()

jsonObjects = []

for oID in objectIDs:
    cObj = {}
    idRelated = allObjects[allObjects["objectID"] == oID]

    cObj["objectID"] = oID
    cObj["objectTypeName"] = idRelated["objectTypeName"][0]
    cObj["locationTypeName"] = idRelated["locationTypeName"][0]

    cObj["coordinates"] = []
    longs = idRelated["long"].values
    lats = idRelated["lat"].values

    for i in range(len(lats)):
        cObj["coordinates"].append({"long": longs[i], "lat": lats[i]})

    jsonObjects.append(cObj)


cursor.execute("select * from tblData")
row2 = cursor.fetchone()

jsonData = []

while row2:
    currD = {}
    currD["id"] = row2[0]
    currD["lat"] = str(row2[1])
    currD["long"] = str(row2[2])
    currD["description"] = row2[3]

    jsonData.append(currD)
    row2 = cursor.fetchone()




from flask import Flask, jsonify, request

app = Flask(__name__)

@app.route('/', methods=['GET'])
def index():
    return jsonify([{"parameters": {"param1": "data","param2": "allcoordinates"}}])

@app.route('/allcoordinates/', methods=['GET'])
def index2():
    return jsonify(jsonObjects)

@app.route('/data/', methods=['GET'])
def index3():
    return jsonify(jsonData)


# a method to run the app
if __name__ == '__main__':
    app.run(debug=True)
