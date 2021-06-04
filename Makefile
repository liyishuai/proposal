all: proposal.pdf

%.pdf: %.tex
	latexmk -pdf $*

jexp.tex: jexp.ott
	ott -i $^ -tex_show_meta false -o $@
	perl -ni -e 'print unless /documentclass/' $@
	head -n -6 $@ | tee $@ > /dev/null

clean:
	latexmk -C proposal
