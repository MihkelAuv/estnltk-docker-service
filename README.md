# Estnltk docker wrapper

Build docker image using
`docker build -t estnltk .`

Run docker image using
`docker run --name estnltk -p 5000:5000 -d --rm estnltk`

If above command gives you an error `exec ./boot.sh: no such file or directory` then possible problem is in boot.sh shell script. Line endings must be converted to Linux format (LF)

## Samples

Use the provided service test clients or use `curl` command line tool:

```console
curl --silent --request POST --header "Content-Type: application/json" --data '"Keerulised sõnad sõnaraamatust"' localhost:5000/lemma
```

