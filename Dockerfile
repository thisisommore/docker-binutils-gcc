FROM ubuntu:22.04
RUN apt-get update && apt-get -y install xz-utils make gcc g++ wget bzip2 flex file gcc-multilib
COPY ./install_bin_utils.sh .
RUN ./install_bin_utils.sh
COPY ./install_gcc.sh .
RUN ./install_gcc.sh
