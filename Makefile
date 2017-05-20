# Makefile to convert Jupyter notebooks to HTML pages
SHELL=/usr/bin/env /bin/bash

all:	export send

send:	send_zamok
send_zamok:
	CP ./ ${Szam}publis/Lempel-Ziv_Complexity.git/

doc:
	pdoc --overwrite --html --html-dir ./doc/ ./src/lempel_ziv_complexity.py
	mv ./doc/lempel_ziv_complexity.m.html ./doc/index.html

CONTENT_IPYNB=$(wildcard *.ipynb */*.ipynb)
CONTENT_HTML=$(CONTENT_IPYNB:.ipynb=.html)

list_nb:
	echo $(CONTENT_IPYNB)
list_html:
	echo $(CONTENT_HTML)

html_notebooks:	$(CONTENT_HTML)

%.html:	%.ipynb
	jupyter-nbconvert "$<" --to html
