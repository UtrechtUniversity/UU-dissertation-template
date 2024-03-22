$main.pdf: main.tex $(wildcard *.tex) $(wildcard FrontMatter/*.tex) $(wildcard BackMatter/*.tex) $(wildcard MainMatter/*.tex)
	pdflatex main.tex
	biber main
	pdflatex main.tex
	pdflatex main.tex
