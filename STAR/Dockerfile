FROM --platform=linux/amd64 ubuntu:20.04
LABEL maintainer "leanne@ebi.ac.uk"
ENV DEBIAN_FRONTEND="noninteractive" TZ="Europe/London"

# Install dependencies
RUN apt-get update && \
    apt-get install -y wget build-essential libz-dev vim-common software-properties-common && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Add a repository with a newer version of g++ and install it
RUN add-apt-repository ppa:ubuntu-toolchain-r/test -y && \
    apt-get update && \
    apt-get install -y g++-9

# Use update-alternatives to set the default g++ version
RUN update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-9 90

# Check g++ version
RUN g++ --version

# Set environment variables
ENV STAR_VERSION 2.7.11b

# Download and install STAR
RUN wget https://github.com/alexdobin/STAR/archive/refs/tags/${STAR_VERSION}.tar.gz && \
    tar -xzf ${STAR_VERSION}.tar.gz && \
    cd STAR-${STAR_VERSION}/source && \
    make CXXFLAGS_SIMD=-std=c++11 STARstatic && \
    mv STAR /usr/local/bin/ && \
    cd ../../ && \
    rm -rf STAR-${STAR_VERSION}*

# Set the working directory
WORKDIR /data

# Default command
CMD ["STAR"]
