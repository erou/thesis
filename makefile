thesis.pdf: thesis.tex introduction.tex preliminary.tex bilinear-complexity.tex hypersymmetric.tex isomorphisms.tex lattices.tex standard.tex erou.bib
	latexmk --pdf thesis.tex
	date >> date.txt && cat msg-auto.txt date.txt >> commit-msg.txt
	git commit -a -F commit-msg.txt && git push
	evince thesis.pdf &
