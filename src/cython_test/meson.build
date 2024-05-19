extensions = [
  'argmax_fast',
  'argmax_fast_v2'
]

cython_cli = find_program('cythoner.py')
cython_c_args = []
_cpp_Wno_cpp = cpp.get_supported_arguments('-Wno-cpp')
is_windows = host_machine.system() == 'windows'
if is_windows
  use_math_defines = ['-D_USE_MATH_DEFINES']
else
  use_math_defines = []
endif
cython_c_args += [_cpp_Wno_cpp, use_math_defines]
cython_cpp_args = cython_c_args

incdir_numpy = meson.get_external_property('numpy-include-dir', 'not-given')
if incdir_numpy == 'not-given'
  # If not specified, try to query NumPy from the build python
  incdir_numpy = run_command(py3,
    [
      '-c',
      'import os; os.chdir(".."); import numpy; print(numpy.get_include())'
    ],
    check: true
  ).stdout().strip()
endif

cython_gen = generator(cython_cli,
  arguments : ['@INPUT@', '@OUTPUT@'],
  output : '@BASENAME@.c')

foreach ext: extensions
  py3.extension_module(ext,
    cython_gen.process(ext + '.pyx'),
    c_args: cython_c_args,
    include_directories: [incdir_numpy],
    install: true,
    subdir: 'src/cython_test'
  )
endforeach

python_sources = [
  '__init__.py',
  'argmax_utils.py'
]

py3.install_sources(
  python_sources,
  pure: false,             # Will be installed next to binaries
  subdir: 'src/cython_test'  # Folder relative to site-packages to install to
)