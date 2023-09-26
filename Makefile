# The paper name should match the repo/directory name
# https://stackoverflow.com/a/23324703
PAPER_NAME:=$(shell basename $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST)))))
# Halt on errors instead of going to the shell
LATEX_OPTS=-halt-on-error -mode=batch

default: paper


paper: Makefile
	echo all | pdflatex $(LATEX_OPTS) $(PAPER_NAME)
	biber $(PAPER_NAME)
	echo all | pdflatex $(LATEX_OPTS) $(PAPER_NAME)
	echo all | pdflatex $(LATEX_OPTS) $(PAPER_NAME)
	echo all | pdflatex $(LATEX_OPTS) $(PAPER_NAME)
	ps2pdf -dPDFSETTINGS=/prepress -dCompatibilityLevel=1.4 -dEmbedAllFonts=true -dSubsetFonts=true -r600 $(PAPER_NAME).pdf $(PAPER_NAME)_opt.pdf
	# Preserve metadata
	pdftk $(PAPER_NAME).pdf dump_data output metadata.txt
	pdftk $(PAPER_NAME)_opt.pdf update_info metadata.txt output $(PAPER_NAME)_opt2.pdf
	qpdf --linearize $(PAPER_NAME)_opt2.pdf $(PAPER_NAME).pdf


tidy: Makefile
	rubber --clean $(PAPER_NAME)


warn: paper
	pdflatex $(PAPER_NAME).tex 2>&1 | grep Warning
	#rubber -W all $(PAPER_NAME).tex


clean: tidy
	rm -f metadata.txt
	rm -f $(PAPER_NAME)*.pdf


.PHONY: tidy

.PHONY: clean
