#!/usr/bin/make -f
## makefile
## Mac Radigan

.PHONY: default init

.DEFAULT_GOAL := default

target  := Book-01-Proposition-02
figures := ./figures

default: doc

doc: pandoc

metapost: init
	mpost $(target)
	epstopdf --outfile=$(figures)/$(target)-1.pdf $(figures)/$(target)-1.mps

pandoc: 
	pandoc $(target).md                           \
	     --wrap=preserve                          \
	     --template=../../include/template.tex    \
	     -f markdown                              \
	     -F pandoc-minted                         \
	     -t latex                                 \
	     -o $(target).tex
	pdflatex --shell-escape $(target).tex

init:
	mkdir -p $(figures)

view:
	@zathura -x a $(target).pdf 1>/dev/null 2>/dev/null

clobber: clean
	-rm -f $(target).pdf

clean:
	-rm -f $(target).tex
	-rm -f $(target).aux
	-rm -f $(target).log
	-rm -f $(target).out
	-rm -f $(target).aux
