FROM ubuntu:16.04

ARG DEBIAN_FRONTEND=noninteractive

# Essentials: developer tools, build tools, OpenBLAS
RUN apt-get update && apt-get install -y --no-install-recommends \
    apt-utils git curl vim unzip openssh-client wget \
    build-essential cmake \
    libopenblas-dev


#
# Python 3.5
#
RUN apt-get install -y --no-install-recommends python3.5 python3.5-dev python3-pip python3-tk && \
    pip3 install --no-cache-dir --upgrade pip setuptools && \
    echo "alias python='python3'" >> /root/.bash_aliases && \
    echo "alias pip='pip3'" >> /root/.bash_aliases

#
# Jupyter Notebook
#
# Allow access from outside the container, and skip trying to open a browser.
# NOTE: disable authentication token for convenience. DON'T DO THIS ON A PUBLIC SERVER.
RUN pip3 --no-cache-dir install jupyter && \
    mkdir /root/.jupyter && \
    echo "c.NotebookApp.ip = '*'" \
         "\nc.NotebookApp.open_browser = False" \
         "\nc.NotebookApp.token = ''" \
         > /root/.jupyter/jupyter_notebook_config.py

# Expondo porta 8888
EXPOSE 8888

# Dependencia para o open-cv
RUN apt-get -y install libgtk2.0-dev

# Instalando dependencias do Mask_RCNN
RUN pip install numpy scipy Pillow cython matplotlib scikit-image opencv-python h5py imgaug IPython[all]
#

# Tensorflow 1.3.0 - CPU
#
RUN pip install tensorflow==1.3.0

# Expose port for TensorBoard
EXPOSE 6006

#
# h5py + Keras
#
RUN pip3 install --no-cache-dir --upgrade h5py keras

#
# PyCocoTools
#
RUN pip3 install --no-cache-dir git+https://github.com/waleedka/coco.git#subdirectory=PythonAPI

# Definindo area de trabalho
WORKDIR "/root"

# Clonando Mask_RCNN
RUN git clone https://github.com/matterport/Mask_RCNN.git

CMD ["/bin/bash"]