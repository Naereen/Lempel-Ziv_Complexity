# GNU Make makefile to build the lempel_ziv_complexity.pyx C extension
#
# MIT Licensed, (C) 2017 Lilian Besson (Naereen)
# https://GitHub.com/Naereen/Lempel-Ziv_Complexity
#

all: clean test build install clean

test:	test2 test3
test2:
	python2 lempel_ziv_complexity.py
test3:
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

# --------------------------------------------------------
# Build and upload to PyPI
build_for_pypi:	clean_pypi_build sdist wheel

test_twine:
	twine upload --sign --repository testpypi dist/*.whl
twine:
	twine upload --sign --repository pypi dist/*.whl

clean_pypi_build:
	-mv -vf dist/* /tmp/
sdist:	sdist.zip sdist.tar.gz
sdist.zip:
	python3 setup.py sdist --formats=zip
	# -gpg --detach-sign -a dist/*.zip
	-ls -larth dist/*.zip
sdist.tar.gz:
	python3 setup.py sdist --formats=gztar
	# -gpg --detach-sign -a dist/*.tar.gz
	-ls -larth dist/*.tar.gz
wheel:
	python3 setup.py bdist_wheel --universal
	# -gpg --detach-sign -a dist/*.whl
	-ls -larth dist/*.whl

# copyso:
# 	-\cp build/lib*/lempel_ziv_complexity*.* ../
# 	-\cp build/lib*/*/lempel_ziv_complexity*.* ../
# 	-\cp build/lib*/*/*/lempel_ziv_complexity*.* ../
