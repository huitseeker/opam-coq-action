#!/bin/sh -ex

# Ensure we persist the opam root
if [ -d "${GITHUB_WORKSPACE}/.opam" ]; then
  mv /home/opam/.opam /home/opam/.opam.old
else
  sudo chown -R opam ${GITHUB_WORKSPACE}
  mv /home/opam/.opam ${GITHUB_WORKSPACE}/.opam
fi
ln -s ${GITHUB_WORKSPACE}/.opam /home/opam/.opam

if [ "${OCAML_VERSION}" != "" ]; then
  OPAMSWITCH="${OCAML_VERSION}"
fi

git -C /home/opam/opam-repository pull && opam update -uy

if [ "$*" = "" ]; then
  opam repo add coq-released https://coq.inria.fr/opam/released
  opam pin add -n .
  opam install -y coq-mathcomp-ssreflect coq-fcsl-pcm
else
  sh -c "opam $*"
fi
