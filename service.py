from flask import Flask, json, jsonify, request, Response
from estnltk import Text

app = Flask(__name__)

@app.route("/lemma", methods = ['POST'])
def lemma():
    request_text = request.get_json(force = True)
    text = Text(request_text)
    text.tag_layer()

    lemmas = []

    for sentence in text.sentences:
        for word in sentence:
            lemmas.append(word.morph_analysis.lemma[0])

    return Response(json.dumps(lemmas),  content_type = 'application/json; charset=utf-8', status = 200)
