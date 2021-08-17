from flask import Flask, Response, json
from estnltk import Text

app = Flask(__name__)

@app.route("/lemma/<sentence>", methods = ['GET'])
def lemma(sentence):
    text = Text(sentence)
    text.tag_layer()

    lemmas = []

    for sentence in text.sentences:
        for word in sentence:
            lemmas.append(word.morph_analysis.lemma[0])

    return Response(json.dumps(lemmas),  content_type = 'application/json; charset=utf-8', status = 200)
