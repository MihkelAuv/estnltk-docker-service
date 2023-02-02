Build docker image using
`docker build -t estnltk .`

Run docker image using
`docker run --name estnltk -p 5000:5000 --rm estnltk`

If above command gives you an error `exec ./boot.sh: no such file or directory` then possible problem is in boot.sh shell script. Line endings must be converted to Linux format (LF)