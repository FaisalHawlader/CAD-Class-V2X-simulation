FROM ubuntu:18.04

# Install common tools
RUN apt-get update -y && DEBIAN_FRONTEND=noninteractive apt-get install -yqqq \
    wget g++ x11-apps software-properties-common

## OMNET++ ##
# Download and install OMNET++
RUN wget --quiet -O /tmp/omnetpp.tgz https://github.com/omnetpp/omnetpp/releases/download/omnetpp-5.6.2/omnetpp-5.6.2-src-linux.tgz && \
    cd /tmp && tar xf omnetpp.tgz && rm omnetpp.tgz && cd /tmp/omnetpp-5.6.2
# Install OMNET++ dependencies
RUN add-apt-repository ppa:ubuntugis/ppa && \
    apt-get update -y && DEBIAN_FRONTEND=noninteractive apt-get install -yqqq \
        wget build-essential gcc g++ bison flex perl \
        python python3 qt5-default libqt5opengl5-dev tcl-dev tk-dev \
        libxml2-dev zlib1g-dev default-jre doxygen graphviz libwebkitgtk-3.0-0 \
        openscenegraph-plugin-osgearth libosgearth-dev
# Build OMNET++
RUN cd /tmp/omnetpp-5.6.2 && \
    ./configure && \
    export PATH=/tmp/omnetpp-5.6.2/bin:$PATH && \
    make -j6 


## SUMO - download an build from sources ##
ENV SUMO_HOME=/tmp/sumo
RUN apt-get update -yqqq && \
    DEBIAN_FRONTEND=noninteractive apt-get install -yqqq cmake python g++ libxerces-c-dev libfox-1.6-dev libgdal-dev libproj-dev libgl2ps-dev git

RUN mkdir -p ${SUMO_HOME} && cd /tmp && \
    git clone --recursive https://github.com/eclipse/sumo && \
    cd $SUMO_HOME && git fetch origin refs/replace/*:refs/replace/*

RUN cd /tmp && wget --quiet https://bootstrap.pypa.io/pip/2.7/get-pip.py && python get-pip.py

RUN mkdir -p ${SUMO_HOME}/build/cmake_build && cd ${SUMO_HOME}/build/cmake_build && \
    cmake ../.. && \
    make -j$(nproc)

RUN cd ${SUMO_HOME}/build/cmake_build && make install
ENV PATH /tmp/omnetpp-5.6.2/bin:$PATH
RUN echo "export PATH=/tmp/omnetpp-5.6.2/bin:$PATH" >> /etc/bash.bashrc

RUN apt-get update -yqqq && apt-get install -yqqq firefox

WORKDIR /project
CMD ["sleep", "infinity"]
