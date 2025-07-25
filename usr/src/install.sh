#!/bin/bash -x

yum update -y && \
    yum install -y \
    gcc \
    openssl-devel \
    bzip2-devel \
    libffi-devel \
    zlib-devel \
    wget \
    make

cd /usr/src && \
    wget https://www.python.org/ftp/python/3.10.18/Python-3.10.18.tgz && \
    tar xzf Python-3.10.18.tgz && \
    cd Python-3.10.18 && \
    ./configure --enable-optimizations && \
    make altinstall && \
    ln -s /usr/local/bin/python3.10 /usr/bin/python3.10 && \
    ln -s /usr/local/bin/pip3.10 /usr/bin/pip3.10 && \
    ln -s /usr/local/bin/pip3.10 /usr/bin/pip && \
    cd /usr/src && \
    rm -rf Python-3.10.18.tgz Python-3.10.18

pip install -e .

#pip install evalscope --no-cache-dir               # Install Native backend (default)
# Additional options
#pip install 'evalscope[vlmeval]' --no-cache-dir      # Install VLMEvalKit backend
#pip install 'evalscope[rag]' --no-cache-dir          # Install RAGEval backend
#pip install 'evalscope[perf]' --no-cache-dir         # Install dependencies for the model performance testing module
#pip install 'evalscope[app]' --no-cache-dir          # Install dependencies for visualization
#pip install 'evalscope[all]' --no-cache-dir          # Install all backends (Native, OpenCompass, VLMEvalKit, RAGEval)
#pip install 'evalscope[opencompass]' --no-cache-dir  # Install OpenCompass backend
