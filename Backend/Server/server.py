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

app = Flask(__name__)
api = Api(app)

cursor.execute("SELECT * FROM tblLocationType")
row = cursor.fetchone()

locationTypes = []

while row:
    # print (str(row[0]) + " " + str(row[1]))
    currLocationType = {}
    currLocationType["locationTypeID"] = row[0]
    currLocationType["locationTypeName"] = str(row[1])

    # print(currLocationType)
    locationTypes.append(currLocationType)

    row = cursor.fetchone()

from flask import Flask, jsonify, request

app = Flask(__name__)


@app.route('/', methods=['GET', 'POST'])
def index():
    if (request.method == 'POST'):
        some_json = request.get_json()
        return jsonify({'you sent': some_json}), 201
    else:
        return jsonify(locationTypes)


@app.route('/multi/<int:num>', methods=['GET'])
def get_multiply10(num):
    return jsonify({'result': num * 10})


if __name__ == '__main__':
    app.run(debug=True)
