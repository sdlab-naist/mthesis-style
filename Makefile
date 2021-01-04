TEX = platex --kanji=utf8
BIBTEX = pbibtex --kanji=utf8
DVIPDF = dvipdfmx
PREVIEW = open -a preview

BIB = mthesis.bib
SRC = mthesis.tex
MAIN= $(SRC:.tex=)
DVI = $(SRC:.tex=.dvi)
PDF = $(SRC:.tex=.pdf)

all: pdf

dvi:
	$(TEX) $(MAIN)
	$(BIBTEX) $(MAIN)
	$(TEX) $(MAIN)	
	$(TEX) $(MAIN)

pdf: dvi
	$(DVIPDF) $(DVI)

runpdf: pdf
	$(PREVIEW) $(PDF)

clean:
	rm -f *.bbl *.blg *.aux *.log *.dvi *.pdf
