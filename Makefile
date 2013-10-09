SRC = $(wildcard *.md)

PDFS=$(SRC:.md=.pdf)
HTML=$(SRC:.md=.html)
LATEX_TEMPLATE=./pandoc-templates/default.latex

all:    clean $(PDFS) $(HTML)

pdf:   clean $(PDFS)
html:  clean $(HTML)

%.html: %.md
	python resume.py html --no-gravatar < $< | pandoc -t html -c "../stylesheets/styles.css" -o index.html

%.pdf:  %.md $(LATEX_TEMPLATE)
	python resume.py tex < $< | pandoc --template=$(LATEX_TEMPLATE) -H header.tex -o $@

clean:
	rm -f *.html *.pdf

$(LATEX_TEMPLATE):
	git submodule update --init
