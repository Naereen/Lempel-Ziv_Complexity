# GNU Make makefile to build the lempel_ziv_complexity.pyx C extension
#
# MIT Licensed, (C) 2017 Lilian Besson (Naereen)
# https://GitHub.com/Naereen/Lempel-Ziv_Complexity
#

all: clean test build install clean

test:
	python2 lempel_ziv_complexity.py
	python3 lempel_ziv_complexity.py

build: ccode build2 build3 buildpyx

buildpyx: buildpyx3

buildpyx2: lempel_ziv_complexity.pyx setup_cython.py
	python2 setup_cython.py build_ext --inplace

buildpyx3: lempel_ziv_complexity.pyx setup_cython.py
	python3 setup_cython.py build_ext --inplace

ccode:
	cython -v -3 lempel_ziv_complexity.pyx

build2: lempel_ziv_complexity.c setup_with_c.py
	python2 setup_with_c.py build

build3: lempel_ziv_complexity.c setup_with_c.py3
	python3 setup_with_c.py3 build

install: install3

install2:
	python2 setup_cython.py install

install3:
	python3 setup_cython.py install

clean:
	-python2 setup_with_c.py  clean
	-python3 setup_with_c.py3 clean
	-python3 setup_cython.py  clean
	rm -vf lempel_ziv_complexity.c

cleancache:
	rm -rfv __pycache__ *.pyc

cleanall: clean cleancache
	rm -rvf /tmp/Lempel-Ziv_Complexity/build/
	mv -vf build /tmp/Lempel-Ziv_Complexity/

open:
	mime-open https://github.com/Naereen/Lempel-Ziv_Complexity

cow:
	cowsay "Go to https://github.com/Naereen/ for more fun stuff"

# copyso:
# 	-\cp build/lib*/lempel_ziv_complexity*.* ../
# 	-\cp build/lib*/*/lempel_ziv_complexity*.* ../
# 	-\cp build/lib*/*/*/lempel_ziv_complexity*.* ../
