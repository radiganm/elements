#!/usr/bin/make -f
## makefile
## Mac Radigan

.PHONY: default generate link

.DEFAULT_GOAL := default

figures := ../figures

default: link

link: generate
	mkdir -p $(figures)
	(cd $(figures); ln -fs ../books/*/figures/*.mps .)

generate:
	$(MAKE) -C Book-01-Proposition-01
	$(MAKE) -C Book-01-Proposition-02

clobber: clean
	$(MAKE) -C Book-01-Proposition-01 $@
	$(MAKE) -C Book-01-Proposition-02 $@

clean:
	$(MAKE) -C Book-01-Proposition-01 $@
	$(MAKE) -C Book-01-Proposition-02 $@

## *EOF*
