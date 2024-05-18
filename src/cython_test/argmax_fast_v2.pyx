import numpy as np
import cython
# "cimport" is used to import special compile-time information
# about the numpy module (this is stored in a file numpy.pxd which is
# distributed with Numpy).
# Here we've used the name "cnp" to make it easier to understand what
# comes from the cimported module and what comes from the imported module,
# however you can use the same name for both if you wish.
cimport numpy as cnp

# It's necessary to call "import_array" if you use any part of the
# numpy PyArray_* API. From Cython 3, accessing attributes like
# ".shape" on a typed Numpy array use this API. Therefore we recommend
# always calling "import_array" whenever you "cimport numpy"
cnp.import_array()

# We now need to fix a datatype for our arrays. I've used the variable
# DTYPE for this, which is assigned to the usual NumPy runtime
# type info object.
DTYPE = np.float64

# "ctypedef" assigns a corresponding compile-time type to DTYPE_t. For
# every type in the numpy module there's a corresponding compile-time
# type with a _t-suffix.
ctypedef cnp.float64_t DTYPE_t

@cython.boundscheck(False)
@cython.wraparound(False)
def argmax_1d(cnp.ndarray[DTYPE_t, ndim=1] R):
    ### initialize variables
    ##cdef Py_ssize_t N = R.shape[0]

    ##cdef Py_ssize_t i = 0
    ##cdef int max_idx = 0
    ##cdef cnp.float64_t current_max = 0

    ### main loop
    ##for i in range(N):
    ##    if R[i] > current_max:
    ##        max_idx = i
    ##        current_max = R[i]
    cdef cnp.ndarray[cnp.int64_t, ndim=0] tmp = np.array(1, dtype=np.int64)

    return cnp.PyArray_ArgMax(R, 0, tmp)
