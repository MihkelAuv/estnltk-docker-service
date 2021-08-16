from flask import Flask, jsonify
from estnltk import Text

app = Flask(__name__)

@app.route("/<word>", methods = ['GET'])
def lemma(word):
    text = Text(word)
    text.tag_layer()
    result = text.morph_analysis.lemma

    return list(result)

    #return "jsonify(lemma = list(result))"