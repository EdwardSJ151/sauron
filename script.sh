#!/bin/bash
# Comandos do job, em bash. Rode com:
#   sauron submit -c job.yaml script.sh

set -e

# segredos ficam num .env na pasta do projeto, nunca no job.yaml
set -a   # exporta as variáveis do .env para o python enxergar
source .env 2>/dev/null || true
set +a

# dependências num venv na pasta do projeto, sobre os pacotes da imagem
export PYTHONNOUSERSITE=1
python -m venv --without-pip --system-site-packages .venv
. .venv/bin/activate
python -m pip install huggingface_hub

python download_synthgen.py
