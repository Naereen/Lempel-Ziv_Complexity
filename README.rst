Python implementation of Lempel-Ziv Complexity
==============================================

This repository contains a small, simple and efficient implement of the `Lempel-Ziv complexity <https://en.wikipedia.org/wiki/Lempel-Ziv_complexity>`__ algorithm.

Examples
--------

Simple usage
~~~~~~~~~~~~

If the `lempel_ziv_complexity.py <https://github.com/Naereen/Lempel-Ziv_Complexity/blob/master/src/lempel_ziv_complexity.py>`__ file is accessible in your PATH or in Python's path:

.. code:: python

    >>> from lempel_ziv_complexity import lempel_ziv_complexity
    >>> s = '1001111011000010'
    >>> lempel_ziv_complexity(s)  # 1 / 0 / 01 / 1110 / 1100 / 0010
    6


Documentation
~~~~~~~~~~~~~

See `this file <https://naereen.github.io/Lempel-Ziv_Complexity/doc/index.html>`__.

With the C extension
~~~~~~~~~~~~~~~~~~~~

If the `lempel_ziv_complexity.so <https://github.com/Naereen/Lempel-Ziv_Complexity/blob/master/src/lempel_ziv_complexity.pyx>`__ file is accessible in your PATH or in Python's path, the same can be used.

Small benchmark
~~~~~~~~~~~~~~~

There is also a Cython version, to have a faster implementation:

.. code:: python

    $ ipython
    ...
    >>> s = '1001111011000010'
    >>> %timeit lempel_ziv_complexity(s)
    6.1 µs ± 33.6 ns per loop (mean ± std. dev. of 7 runs, 100000 loops each)
    >>> %timeit lempel_ziv_complexity_cython(s)
    132 ns ± 2.55 ns per loop (mean ± std. dev. of 7 runs, 10000000 loops each)


The speedup is typically between x50 and x100.
It is not shipped with the `PyPi` version, see `directly on GitHub <https://github.com/Naereen/Lempel-Ziv_Complexity/blob/master/src/lempel_ziv_complexity.pyx>`_ if needed.

Demo on a `Jupyter notebook <https://www.Jupyter.org/>`__
---------------------------------------------------------

See this notebook: `on nbviewever <https://nbviewer.jupyter.org/github/Naereen/Lempel-Ziv_Complexity/blob/master/Short_study_of_the_Lempel-Ziv_complexity.ipynb>`__.

--------------

Install and build
-----------------

Manually ?
~~~~~~~~~~

Easy!

Clone this repository, go in the folder, compile, test, and if it works,
install it.

.. code:: bash

    cd /tmp/
    git clone https://GitHub.com/Naereen/Lempel-Ziv_Complexity
    cd Lempel-Ziv_Complexity/src/
    make build
    make test     # should pass
    make install  # mv the build/lib*/*.so files where you need them


Be sure to include the dynamic library when you need it, or in a folder
accessible by your Python interpreter (somewhere in ``sys.path``). The
file is ``lempel_ziv_complexity_cython.so`` (for Python 2) or the
``lempel_ziv_complexity_cython.cpython-35m-x86_64-linux-gnu.so`` (for
Python 3.5, or higher, adapt the name).

With pip ?
----------

This project is hosted on `the Pypi package repository <https://pypi.org/project/Lempel-Ziv_Complexity/>`__.


.. code:: bash

   sudo pip install lempel_ziv_complexity
   python -c "from lempel_ziv_complexity import lempel_ziv_complexity; print(lempel_ziv_complexity('1001111011000010') == 6)"  # test


|PyPI version|

|PyPI implementation|

|PyPI pyversions|

--------------

About
-----

Language?
~~~~~~~~~

Python v2.7+ or Python v3.1+.

-  `Numba <http://numba.pydata.org/>`__ can be used to speed up the pure
   Python version.
-  `Cython <http://cython.org/>`__ is *needed* to build the C extension
   (faster).

License ?
~~~~~~~~~

`MIT Licensed <https://lbesson.mit-license.org/>`__ (file
`LICENSE <LICENSE>`__). © `Lilian
Besson <https://GitHub.com/Naereen>`__, 2017.
|GitHub license|

|Maintenance|
|Ask Me Anything !|
|Analytics|

|ForTheBadge uses-badges|
|ForTheBadge uses-git|

|forthebadge made-with-python|
|ForTheBadge built-with-science|

.. |PyPI version| image:: https://img.shields.io/pypi/v/lempel_ziv_complexity.svg
   :target: https://pypi.org/project/Lempel-Ziv_Complexity/
.. |PyPI implementation| image:: https://img.shields.io/pypi/implementation/lempel_ziv_complexity.svg
.. |PyPI pyversions| image:: https://img.shields.io/pypi/pyversions/lempel_ziv_complexity.svg
.. |GitHub license| image:: https://img.shields.io/github/license/Naereen/Lempel-Ziv_Complexity.svg
   :target: https://github.com/Naereen/badges/blob/master/LICENSE
.. |Maintenance| image:: https://img.shields.io/badge/Maintained%3F-yes-green.svg
   :target: https://GitHub.com/Naereen/Lempel-Ziv_Complexity/graphs/commit-activity
.. |Ask Me Anything !| image:: https://img.shields.io/badge/Ask%20me-anything-1abc9c.svg
   :target: https://GitHub.com/Naereen/ama
.. |Analytics| image:: https://ga-beacon.appspot.com/UA-38514290-17/github.com/Naereen/Lempel-Ziv_Complexity/README.md?pixel
   :target: https://GitHub.com/Naereen/Lempel-Ziv_Complexity/
.. |ForTheBadge uses-badges| image:: http://ForTheBadge.com/images/badges/uses-badges.svg
   :target: http://ForTheBadge.com
.. |ForTheBadge uses-git| image:: http://ForTheBadge.com/images/badges/uses-git.svg
   :target: https://GitHub.com/
.. |forthebadge made-with-python| image:: http://ForTheBadge.com/images/badges/made-with-python.svg
   :target: https://www.python.org/
.. |ForTheBadge built-with-science| image:: http://ForTheBadge.com/images/badges/built-with-science.svg
   :target: https://GitHub.com/Naereen/
