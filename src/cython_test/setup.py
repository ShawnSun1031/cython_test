from setuptools import setup, Extension
from Cython.Build import cythonize
import numpy as np

ext_modules=[
    Extension("argmax_fast",       ["argmax_fast.pyx"]),
    Extension("argmax_fast_v2",         ["argmax_fast_v2.pyx"]),
]

setup(
    ext_modules=cythonize(ext_modules,
                        language_level=3,
                        annotate = True,
                        force =True,),
    include_dirs=[np.get_include()],
)