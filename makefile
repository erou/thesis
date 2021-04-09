thesis.pdf: thesis.tex introduction.tex preliminary.tex bilinear-complexity.tex hypersymmetric.tex isomorphisms.tex lattices.tex standard.tex french.tex conclusion.tex preface.tex erou.bib
	latexmk --pdf thesis.tex
	evince thesis.pdf &
