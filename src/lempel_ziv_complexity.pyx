# -*- coding: utf-8 -*-
"""Lempel-Ziv complexity for a binary sequence, in simple Cython code (C extension).

- How to build it? Simply use the file :download:`Makefile` provided in this folder.

- How to use it? From Python, it's easy:

>>> from lempel_ziv_complexity_cython import lempel_ziv_complexity
>>> s = '1001111011000010'
>>> lempel_ziv_complexity(s)  # 1 / 0 / 01 / 11 / 10 / 110 / 00 / 010
8

- Requirements: you need to have [Cython](http://Cython.org/) installed, and use [CPython](https://www.Python.org/).

- MIT Licensed, (C) 2017-2019 Lilian Besson (Naereen)
  https://GitHub.com/Naereen/Lempel-Ziv_Complexity
"""

__author__ = "Lilian Besson"
__version__ = "0.2"


import cython

# Define the type of unsigned int32
ctypedef unsigned int DTYPE_t


# turn off bounds-checking for entire function, quicker but less safe
@cython.boundscheck(False)
def lempel_ziv_complexity(str sequence):
    """Lempel-Ziv complexity for a binary sequence, in simple Cython code (C extension).

    It is defined as the number of different substrings encountered as the stream is viewed from begining to the end.
    As an example:

    >>> s = '1001111011000010'
    >>> lempel_ziv_complexity(s)  # 1 / 0 / 01 / 11 / 10 / 110 / 00 / 010
    8

    Marking in the different substrings the sequence complexity :math:`\mathrm{Lempel-Ziv}(s) = 8`: :math:`s = 1 / 0 / 01 / 11 / 10 / 110 / 00 / 010`.

    - See the page https://en.wikipedia.org/wiki/Lempel-Ziv_complexity for more details.


    Other examples:

    >>> lempel_ziv_complexity('1010101010101010')  # 1, 0, 10, 101, 01, 010, 1010
    7
    >>> lempel_ziv_complexity('1001111011000010000010')  # 1, 0, 01, 11, 10, 110, 00, 010, 000
    9
    >>> lempel_ziv_complexity('100111101100001000001010')  # 1, 0, 01, 11, 10, 110, 00, 010, 000, 0101
    10

    - Note: it is faster to give the sequence as a string of characters, like `'10001001'`, instead of a list or a numpy array.
    - Note: see this notebook for more details, comparison, benchmarks and experiments: https://Nbviewer.Jupyter.org/github/Naereen/Lempel-Ziv_Complexity/Short_study_of_the_Lempel-Ziv_complexity.ipynb
    - Note: there is also a naive Python version, for speedup, see :download:`lempel_ziv_complexity.py`.
    """
    cdef set sub_strings = set()
    cdef str sub_str = ""
    cdef DTYPE_t n = len(sequence)
    cdef DTYPE_t ind = 0
    cdef DTYPE_t inc = 1
    while True:
        if ind + inc > len(sequence):
            break
        sub_str = sequence[ind : ind + inc]
        if sub_str in sub_strings:
            inc += 1
        else:
            sub_strings.add(sub_str)
            ind += inc
            inc = 1
    return len(sub_strings)
