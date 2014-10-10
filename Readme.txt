Debye Decomposition tools as presented in the paper titled "Debye decomposition
of time-lapse spectral induced polarisation data"


Overview
--------

The software package is written in pure Python, and distributed in two parts
(with corresponding subdirectories):

    - 'geccoinv': A (more or less) generic N-dimensional inversion framework
    - 'dd_interfaces': Implemntation of the various Debye decomposition
                       interfaces

Both subdirectories are separate source code repositories (managed via git) and
are here bundled only for convenience. For the location of the upstream
repositories, see the section 'Upstream development' below.

Requirements
------------

The following Python packages are required to run the Debye decomposition
routines:

numpy
scipy
matplotlib

In order to build the documentation, the additional packages are required:

sphinx

Under Debian-related linux systems, these packages can be installed using the
commands:

    sudo apt-get install texlive-latex-base texlive-latex-extra\
        texlive-fonts-recommended texlive-fonts-extra dvipng
    sudo apt-get install python2.7-numpy python-matplotlib python2.7-scipy\
        python-setuptools python-nose python-tornado
    sudo apt-get install python-sphinx

Under Windows, the program was tested using the 'pythonxy' distribution
(https://code.google.com/p/pythonxy/). Additionally, latex support ist required
for all plots. The programs was tested with the Miktex distribution
(http://www.miktex.org/). Miktex will install any required Latex packages
when required.

Installation
------------

The packages use the setuptools package, and the installation under linux is
done using the following commands:

    cd GeccoInv
    python setup.py install
    cd ..
    cd DD_Interfaces
    python setup.py install
    cd ..

Under windows, 'python' has to be replaced by 'python.exe'

Upstream development
--------------------

Development, bug reports, and public discussion is managed using the github.com
platform:

https://github.com/m-weigand/GeccoInv
https://github.com/m-weigand/DD_Interfaces

Comments, bug reports, and recommendations are welcome!

Licence
-------
Both projects are released under the GPL3 licence (see LICENCE files).
