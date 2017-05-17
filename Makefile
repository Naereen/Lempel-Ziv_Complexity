# GNU Make makefile to build the lempel_ziv_complexity_cython.pyx C extension
#
# MIT Licensed, (C) 2017 Lilian Besson (Naereen)
# https://GitHub.com/Naereen/Lempel-Ziv_Complexity
#

all: clean ccode build install clean
small: clean buildpyx install clean

ccode:
	cython -v -3 lempel_ziv_complexity_cython.pyx

build: build2 build3 buildpyx

build2: lempel_ziv_complexity_cython.c setup_with_c.py
	python2 setup_with_c.py build

build3: lempel_ziv_complexity_cython.c setup_with_c.py3
	python3 setup_with_c.py3 build

buildpyx: lempel_ziv_complexity_cython.pyx setup_cython.py
	python3 setup_cython.py build_ext

install:
	python3 setup_cython.py install  # FIXME test this
	# -\cp build/lib*/lempel_ziv_complexity*.* ../
	# -\cp build/lib*/*/lempel_ziv_complexity*.* ../
	# -\cp build/lib*/*/*/lempel_ziv_complexity*.* ../

clean: setup_with_c.py setup_with_c.py3 setup_cython.py
	python2 setup_with_c.py clean
	python3 setup_with_c.py3 clean
	python3 setup_cython.py clean

cleanall:
	rm -rvf /tmp/Lempel-Ziv_Complexity/build/
	mv -vf build /tmp/Lempel-Ziv_Complexity/
