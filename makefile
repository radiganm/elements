#!/usr/bin/make -f
## makefile (for Elements)
## Mac Radigan

.PHONY: init dox pandoc view clean clobber

.DEFAULT_GOAL := default

target = Elements

template = ./template
output   = ./output
figures  = ./figures

default: doc

doc: pandoc

books: init
	$(MAKE) -C books

dox: books
	which python3
	rm -rf $(output)
	env PYTHONPATH=./dox/library       \
	  python3 ./dox/dox.py             \
	    -v -r                          \
	    -I ./include:./books           \
	    -t $(template)                 \
	    -o $(output)

pandoc: dox
	pandoc $(output)/$(target).md          \
	     --wrap=preserve                   \
	     --template=./include/template.tex \
	     -f markdown                       \
	     -F pandoc-minted                  \
	     -t latex                          \
	     -o $(target).tex
	pdflatex --shell-escape $(target).tex

clobber: clean
	$(MAKE) -C books $@
	-rm -f $(target).pdf

clean:
	$(MAKE) -C books $@
	-rm -f $(target).tex
	-rm -f $(target).aux
	-rm -f $(target).log
	-rm -f $(target).out
	-rm -f $(target).aux

init:
	mkdir -p $(figures)

view:
	@zathura -x -a $(target).pdf 1>/dev/null 2>/dev/null

update:
	git submodule init &&   \
	git submodule update && \
	(cd dox; git pull origin master)

## *EOF*
