import psycopg2
from flask import Flask, jsonify
import json

app = Flask(__name__) # setup initial flask app; gets called throughout in routes

# Connect to the PostgreSQL database

pgSQL_connect = {
    'dbname':"gis5572",
    'user':"postgres",
    'password':"19950920840920Yu",
    'host':"34.133.74.255"
}


@app.route('/') #python decorator 
def hello_world(): #function that app.route decorator references
  response = hello()
  return response

def hello():
  return "GIS 5572 Lab 1_test"

# Route to retrieve polygon as GeoJSON
@app.route('/geojson', methods=['POST', 'GET'])
def get_geojson():
    # Execute a query to retrieve the polygon from the database
    cursor = conn.cursor()
    cursor.execute("SELECT ST_AsGeoJSON(polygon_lab1.*) FROM polygon_lab1;")
    result = cursor.fetchall()
    return result[0][0]
    
    if result is None:
        return jsonify({'error': 'Polygon not found'}), 404
    else:
        return jsonify({'geojson': result[0]})

if __name__ == "__main__":
    app.run(
      #debug=True, #shows errors 
      host='0.0.0.0', #tells app to run exposed to outside world
      port=5000)
