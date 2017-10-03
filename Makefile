SRC = $(wildcard *.md)

PDFS=$(SRC:.md=.pdf)
HTML=$(SRC:.md=.html)

all:    clean $(PDFS) $(HTML)

pdf:   clean $(PDFS)
html:  clean $(HTML)

%.html: %.md
	python resume.py html < $< | pandoc -t html -c resume.css -o $@

%.pdf:  %.md
	python resume.py tex < $< | pandoc --template=./pandoc-templates/default.latex -H header.tex -o $@

clean:
	rm -f *.html *.pdf

foo:
	docker run -v $(PWD):/documents fxdgear/resume:latest make all
