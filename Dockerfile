FROM ocaml/opam2

LABEL "com.github.actions.name"="opam-install"
LABEL "com.github.actions.description"="opam environment with multiple compilers"
LABEL "com.github.actions.icon"="package"
LABEL "com.github.actions.color"="orange"

LABEL "repository"="http://github.com/avsm/actions-ocaml"
LABEL "homepage"="http://github.com/avsm/actions-ocaml"
LABEL "maintainer"="Francois Garillot <francois@garillot.net>"

ENV OPAMYES=1
ENV OPAMROOT=/home/opam/.opam
ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
