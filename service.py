from flask import Flask, jsonify
from estnltk import Text

app = Flask(__name__)

@app.route("/", methods = ['GET'])
def hello_world():
    return jsonify({'message': 'Hello world'})