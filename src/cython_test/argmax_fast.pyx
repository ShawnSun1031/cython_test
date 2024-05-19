import cython

@cython.boundscheck(False)
@cython.wraparound(False)
# Memo contig
def argmax_1d(double [::1] R):
    # initialize variables
    cdef:
        Py_ssize_t N = R.shape[0]
        Py_ssize_t i = 0
        Py_ssize_t max_idx = 0
        double current_max = 0.0

    # main loop
    for i in range(N):
        if R[i] > current_max:
            max_idx = i
            current_max = R[i]

    return max_idx