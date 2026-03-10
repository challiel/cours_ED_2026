#!/bin/bash

OLLAMA_VERSION=${1:-v0.13.5}

OLLAMA_ROOT=$PWD/ollama
mkdir -p ${OLLAMA_ROOT} || exit 1

OLLAMA_VERSION_URL=https://github.com/ollama/ollama/releases/download/${OLLAMA_VERSION}/ollama-linux-amd64.tgz
mkdir -p ${OLLAMA_ROOT}/${OLLAMA_VERSION} && {
  wget -O - ${OLLAMA_VERSION_URL} 2>wget.err | tar xzvf - -C ${OLLAMA_ROOT}/${OLLAMA_VERSION}
}

export PATH=${OLLAMA_ROOT}/${OLLAMA_VERSION}/bin:${PATH}

echo "##### LAUNCHING OLLAMA SERVER..."
ollama serve &>ollama.log &

sleep 10

echo "##### OLLAMA SERVER LAUNCHED (See logs)"
cat ollama.log

echo "##### TESTING OLLAMA REQUEST"
wget http://127.0.0.1:11434 && cat index.html
echo "The end"
