#!/bin/bash

echo -e "### Running cython-lint $PATH ###\n"
python -m cython-lint CYTHON_TEST/
status=$?
# if [[ $status -eq 0 ]]
# then
#     echo -e "No problem detected by cython-lint\n"
# else
#     echo -e "Problems detected by cython-lint, please fix them\n"
#     global_status=1
# fi