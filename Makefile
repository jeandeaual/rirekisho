SHELL = /bin/bash

# Get the time of the last commit in seconds since the Unix Epoch
COMMIT_EPOCH = $(shell git log -1 --pretty=%ct)
TARGETS := $(shell find . -type f -name '*.tex' -maxdepth 1 | sed 's/^\.\/\(.*\)\.tex$$/build\/\1\.pdf/')

# Makes sure latexmk always runs
.PHONY: $(TARGETS) all clean

all: $(TARGETS)

$(TARGETS): build/%.pdf: %.tex
	SOURCE_DATE_EPOCH=$(COMMIT_EPOCH) latexmk -use-make $<
clean:
	latexmk -c
delete:
	latexmk -C
	-@rm -rf build 2>/dev/null
