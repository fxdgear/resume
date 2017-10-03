FROM ubuntu:latest

RUN apt-get update
RUN apt-get install -y pandoc python texlive texlive-latex-extra tex-gyre make

VOLUME /documents
WORKDIR /documents

CMD ["make all"]
