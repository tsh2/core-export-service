#! /bin/sh

sudo apk update
sudo apk add libsodium-dev libffi-dev gcc
sudo apk add m4 perl 
sudo pacman -Sy clingo

opam install core
opam init -a
eval `opam config env`
opam install -y depext
opam depext -y conf-gmp.1

opam install -y yojson

opam pin add -n sodium https://github.com/tsh2/ocaml-sodium.git#with_auth_hmac256
opam pin add -n opium https://github.com/tsh2/opium.git#fix-ssl-option

opam pin add -y export-service .

mv /home/databox/.opam/system/bin/export-service /home/databox/service
rm -rf /home/databox/.opam

sudo apk del m4 perl
sudo apk del libffi-dev
