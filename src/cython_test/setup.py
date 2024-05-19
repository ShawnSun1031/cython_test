from Cython.Build import cythonize
from setuptools import Extension, setup

# Don't use the deprecated NumPy C API. Define this to a fixed version instead of
# NPY_API_VERSION in order not to break compilation for released SciPy versions
# when NumPy introduces a new deprecation. Use in setup.py::
#
#   config.add_extension('_name', sources=['source_fname'], **numpy_nodepr_api)
# https://github.com/scikit-image/scikit-image/blob/main/skimage/_build_utils/__init__.py

ext_modules = [
    Extension("argmax_fast", ["argmax_fast.pyx"]),
    Extension(
        "argmax_fast_v2",
        ["argmax_fast_v2.pyx"],
        define_macros=[("NPY_NO_DEPRECATED_API", "NPY_1_7_API_VERSION")],
    ),
]

import numpy as np # noqa


setup(
    ext_modules=cythonize(
        ext_modules,
        language_level=3,
        annotate=True,
        force=True,
    ),
    include_dirs=[np.get_include()],
)
