#!/bin/bash

OLLAMA_VERSION=v0.13.5

OLLAMA_ROOT=$PWD/ollama
mkdir -p ${OLLAMA_ROOT} || exit 1

OLLAMA_VERSION_URL=https://github.com/ollama/ollama/releases/download/${OLLAMA_VERSION}/ollama-linux-amd64.tgz
mkdir -p ${OLLAMA_ROOT}/${OLLAMA_VERSION} && {
  wget -O - ${OLLAMA_VERSION_URL} 2>wget.err | tar xzvf - -C ${OLLAMA_ROOT}/${OLLAMA_VERSION}
}

export LD_LIBRARY_PATH=${OLLAMA_ROOT}/${OLLAMA_VERSION}/lib:${LD_LIBRARY_PATH}
export PATH=${OLLAMA_ROOT}/${OLLAMA_VERSION}/bin:${PATH}
export OLLAMA_MODELS=${OLLAMA_ROOT}/${OLLAMA_VERSION}/.ollama
