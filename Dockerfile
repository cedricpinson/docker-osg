FROM ubuntu:14.04.1

MAINTAINER trigrou


RUN apt-get -y update
RUN apt-get -y install wget
RUN apt-get -y install git
RUN apt-get -y install cmake
RUN apt-get -y install freeglut3-dev
RUN apt-get -y install libjpeg-dev
RUN apt-get -y install libtiff5-dev
RUN apt-get -y install libpng12-dev
RUN apt-get -y install g++
RUN apt-get -y install ccache
RUN echo "/usr/local/lib64/" >/etc/ld.so.conf.d/lib64.conf

RUN mkdir /root/fbx && cd /root/fbx && wget http://images.autodesk.com/adsk/files/fbx20142_1_fbxsdk_linux.tar.gz
RUN cd /root/fbx && tar xvfz fbx20142_1_fbxsdk_linux.tar.gz && chmod +x fbx20142_1_fbxsdk_linux

# need to check whic variable is needed to build fbx plugin

RUN cd /root/ && git clone https://github.com/cedricpinson/osg
RUN mkdir -p /root/osg/build
RUN cd /root/osg/build && cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_COMPILER="ccache" -DCMAKE_CXX_COMPILER_ARG1="g++" ../
#RUN cd /root/osg/build && make -j4 install


#RUN cd /root/fbx && eval 'echo -e "y\nyes\nyes" | ./fbx20142_1_fbxsdk_linux ./'
#RUN rm /root/fbx/fbx20142_1_fbxsdk_linux.tar.gz /root/fbx/fbx20142_1_fbxsdk_linux
