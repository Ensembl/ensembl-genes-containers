FROM python:3.11-slim

LABEL maintainer="dev@ensembl.org"
LABEL org.opencontainers.image.title="ensembl-genes"
LABEL org.opencontainers.image.description="Container for stable Ensembl Genes CLI tools from the main branch"
LABEL org.opencontainers.image.source="https://github.com/Ensembl/ensembl-genes"

ARG DEBIAN_FRONTEND=noninteractive
ARG ENSEMBL_GENES_REPO=https://github.com/Ensembl/ensembl-genes.git
ARG ENSEMBL_GENES_REF=main

RUN apt-get update && apt-get install -y --no-install-recommends \
    bash \
    ca-certificates \
    git \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /opt

RUN git clone --depth 1 --branch "${ENSEMBL_GENES_REF}" "${ENSEMBL_GENES_REPO}" ensembl-genes

WORKDIR /opt/ensembl-genes

RUN python -m pip install --no-cache-dir --upgrade pip && \
    python -m pip install --no-cache-dir .

COPY entrypoint.sh /usr/local/bin/ensembl-genes

RUN chmod +x /usr/local/bin/ensembl-genes

WORKDIR /work

ENTRYPOINT ["ensembl-genes"]
CMD ["help"]
