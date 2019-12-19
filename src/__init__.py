# -*- coding: utf-8 -*-
""" LempelZiv module :

- :func:`lempel_ziv_complexity` is the pure Python code,
- :download:`lempel_ziv_complexity_cython.pyx` implements it in Cython (C-extension for Python).

- Example of speed-up with the Cython-powered function:

>>> s = '1001111011000010'
>>> %timeit lempel_ziv_complexity(s)
6.1 µs ± 33.6 ns per loop (mean ± std. dev. of 7 runs, 100000 loops each)
>>> %timeit lempel_ziv_complexity_cython(s)
132 ns ± 2.55 ns per loop (mean ± std. dev. of 7 runs, 10000000 loops each)

- MIT Licensed, (C) 2017 Lilian Besson (Naereen)
  https://GitHub.com/Naereen/Lempel-Ziv_Complexity
"""

__author__ = "Lilian Besson"
__version__ = "0.2.2"

from .lempel_ziv_complexity import lempel_ziv_decomposition, lempel_ziv_complexity
