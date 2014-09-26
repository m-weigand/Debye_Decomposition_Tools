# Start from the jessie-base image
FROM mweigand/jessie-base

RUN apt-get update

# install the requirements as stated in the Readme
RUN apt-get --yes install texlive-latex-base texlive-latex-extra texlive-fonts-recommended texlive-fonts-extra dvipng
RUN apt-get --yes install python2.7-numpy python-matplotlib python2.7-scipy python-setuptools python-nose python-tornado
RUN apt-get --yes install python-sphinx
