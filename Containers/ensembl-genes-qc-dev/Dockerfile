FROM python:3.12-slim

LABEL maintainer="dev@ensembl.org"
LABEL org.opencontainers.image.title="ensembl-genes-qc-dev"
LABEL org.opencontainers.image.description="QC development container for Ensembl Genes annotation QC code"
LABEL org.opencontainers.image.source="https://github.com/Ensembl/ensembl-genes"

ARG DEBIAN_FRONTEND=noninteractive
ARG ENSEMBL_GENES_REPO=https://github.com/Ensembl/ensembl-genes.git
ARG ENSEMBL_GENES_REF=feature/annotation-qc

RUN apt-get update && apt-get install -y --no-install-recommends \
    bash \
    ca-certificates \
    git \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /opt

RUN git clone --depth 1 --branch "${ENSEMBL_GENES_REF}" "${ENSEMBL_GENES_REPO}" ensembl-genes

RUN python -m pip install --no-cache-dir --upgrade pip && \
    python -m pip install --no-cache-dir /opt/ensembl-genes

WORKDIR /work

CMD ["annotation-qc", "--help"]
