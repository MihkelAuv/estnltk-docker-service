# Estnltk docker wrapper

Build docker image using
`docker build -t estnltk .`

Run docker image using
`docker run --name estnltk -p 5000:5000 -d --rm estnltk`

## Samples

Use the provided service test clients or use `curl` command line tool:

```console
curl --silent --request POST --header "Content-Type: application/json" --data '"Keerulised sõnad sõnaraamatust"' localhost:5000/lemma
```
