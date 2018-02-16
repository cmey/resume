
CV_NAME = christophe-meyer-cv

cv: clean
	TEX=${CV_NAME} make compile
	TEX=${CV_NAME} make clean

clean:
	# Remove BibTeX and TeX auxiliary files
	rm -rf *.bbl *.blg *.aux *.log *.out

compile:
	pdflatex ${TEX}.tex
	# bibtex each citation class separately
	# These are defined in .tex, not the names of the .bib files
	bibtex article
	bibtex patent
	bibtex talk
	pdflatex ${TEX}.tex
	pdflatex ${TEX}.tex
