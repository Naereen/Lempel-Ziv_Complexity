#!/usr/bin/env python3
# -*- coding: utf-8 -*-
""" Utility for building the C library for Python 2/3.

- MIT Licensed, (C) 2017 Lilian Besson (Naereen)
  https://GitHub.com/Naereen/Lempel-Ziv_Complexity
"""

__author__ = "Lilian Besson (Naereen)"
__version__ = "0.1"

from distutils.core import setup
from Cython.Build import cythonize


setup(name='Lempel-Ziv complexity',
      version='0.1',
      description='Fast implementation of the Lempel-Ziv complexity function',
      ext_modules=cythonize('lempel_ziv_complexity.pyx')
      )
