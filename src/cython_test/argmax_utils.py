import argmax_fast_v2
import argmax_fast
import numpy as np

if __name__ == "__main__":
    test_data = np.random.rand(100)
    v2 = argmax_fast_v2.argmax_1d(test_data)
    v1 = argmax_fast.argmax_1d(test_data)