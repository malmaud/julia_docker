FROM debian:jessie
MAINTAINER Jon Malmaud (malmaud@gmail.com)
RUN apt-get update && apt-get install -y \
    gcc-4.9 \
    g++-4.9 \
    gfortran \
    git \
    perl \
    m4 \
    wget \
    cmake \
    libssl-dev \
    python2.7 \
    libncurses5-dev \
    libedit-dev \
    swig \
    bzip2
WORKDIR /
RUN git clone https://github.com/JuliaLang/julia.git julia_src
WORKDIR /usr/bin
RUN rm -f gcc g++
RUN ln -s g++-4.9 g++
RUN ln -s gcc-4.9 gcc
WORKDIR /julia_src
ADD Make.user Make.user
ADD deps_Makefile.patch deps_Makefile.patch
ADD lldb-python.patch deps/lldb-python.patch
RUN patch -p1 < deps_Makefile.patch
RUN make install prefix=/julia -j4
ENTRYPOINT ["/julia/julia"]