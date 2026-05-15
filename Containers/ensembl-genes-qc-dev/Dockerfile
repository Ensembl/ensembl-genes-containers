FROM python:3.11-slim

LABEL maintainer="dev@ensembl.org"
LABEL org.opencontainers.image.title="ensembl-genes-qc-dev"
LABEL org.opencontainers.image.description="QC development container for Ensembl Genes feature/run_metrics parsing code"
LABEL org.opencontainers.image.source="https://github.com/Ensembl/ensembl-genes"

ARG DEBIAN_FRONTEND=noninteractive
ARG ENSEMBL_GENES_REPO=https://github.com/Ensembl/ensembl-genes.git
ARG ENSEMBL_GENES_REF=feature/run_metrics

RUN apt-get update && apt-get install -y --no-install-recommends \
    bash \
    ca-certificates \
    git \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /opt

RUN git clone --depth 1 --branch "${ENSEMBL_GENES_REF}" "${ENSEMBL_GENES_REPO}" ensembl-genes

RUN python -m pip install --no-cache-dir --upgrade pip && \
    python -m pip install --no-cache-dir pandas

ENV PYTHONPATH=/opt/ensembl-genes/src/python
ENV ENSEMBL_GENES_QC_ROOT=/opt/ensembl-genes/src/python/ensembl/genes/annotation-qc
ENV ENSEMBL_GENES_QC_VALUE_MAP=/opt/ensembl-genes/src/python/ensembl/genes/annotation-qc/parsers/value_map.json

COPY entrypoint.sh /usr/local/bin/ensembl-genes-qc-dev

RUN chmod +x /usr/local/bin/ensembl-genes-qc-dev

WORKDIR /work

ENTRYPOINT ["ensembl-genes-qc-dev"]
CMD ["help"]
