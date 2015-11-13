#!/usr/bin/env python
from setuptools import setup
import os
import subprocess
# from setuptools import find_packages
# find_packages

# under windows, run
# python.exe setup.py bdist --format msi
# to create a windows installer

# TODO: understand the inclusion of requirements

version_short = '0.8'
version_long = '0.8.0'
# if we are in a git directory, use the last git commit as the version
cmd = 'git log -1 --format=%H'
try:
    if os.path.isdir('.git'):
        git_output = subprocess.check_output(cmd, shell=True).strip()
        version_long += '+' + git_output
except:
    pass

if __name__ == '__main__':
    setup(name='dd_tools',
          version=version_long,
          description='Debye decomposition tools',
          author='Maximilian Weigand',
          author_email='mweigand@geo.uni-bonn.de',
          url='http://www.geo.uni-bonn.de',
          # find_packages() somehow does not work under Win7 when creating a
          # msi # installer
          # packages=find_packages(),
          package_dir={'lib_cc': 'geccoinv/lib/lib_cc',
                       'lib_cc2': 'geccoinv/lib/lib_cc2',
                       'lib_cc_conductivity': 'geccoinv/lib/lib_cc_conductivity',
                       'NDimInv': 'geccoinv/lib/NDimInv',
                       'sip_formats': 'geccoinv/lib/sip_formats',
                       'lib_dd': 'dd_interfaces/lib/lib_dd',
                       # 'lib_dd.conductivity': 'dd_interfaces/lib',
                       # 'lib_dd.io': 'dd_interfaces/lib',
                       },
          packages=['lib_cc',
                    'lib_cc2',
                    'lib_cc_conductivity',
                    'NDimInv',
                    'sip_formats',
                    'lib_dd',
                    'lib_dd.conductivity',
                    'lib_dd.io'],
          scripts=['dd_interfaces/src/dd_single/dd_single.py',
                   'dd_interfaces/src/dd_time/dd_time.py',
                   'dd_interfaces/src/dd_space_time/dd_space_time.py',
                   'dd_interfaces/src/dd_test/dd_test.py',
                   'dd_interfaces/src/ddps/ddps.py',
                   'dd_interfaces/src/ddplot/ddplot.py',
                   # 'dd_interfaces/src/ddpt/ddpt.py',
                   #'dd_interfaces/src/ddpst/ddpst.py',
                   ],
          install_requires=['numpy', 'scipy>=0.12', 'matplotlib']
          )
