#!/usr/bin/env python3
# -*- coding: utf-8 -*-
""" Utility for building the C library for Python 3.

- MIT Licensed, (C) 2017 Lilian Besson (Naereen)
  https://GitHub.com/Naereen/Lempel-Ziv_Complexity
"""

__author__ = "Lilian Besson"
__version__ = "0.1"

from distutils.core import setup, Extension

module1 = Extension('lempel_ziv_complexity_cython', sources=['lempel_ziv_complexity_cython.c'])


setup(name='Lempel-Ziv complexity',
      version='0.1',
      description='Fast implementation of the Lempel-Ziv complexity function',
      ext_modules=[module1]
      )
