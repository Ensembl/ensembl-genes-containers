FROM python:3.11-slim-bookworm

LABEL maintainer="dev@ensembl.org"
LABEL org.opencontainers.image.title="ensembl-analysis"
LABEL org.opencontainers.image.description="Container for the Ensembl analysis stack used by legacy statistics workflows"
LABEL org.opencontainers.image.source="https://github.com/Ensembl/ensembl-genes-containers"

ARG DEBIAN_FRONTEND=noninteractive
ARG ENSEMBL_REF=release/116
ARG ANALYSIS_REF=main
ARG GENES_REF=main
ARG BIOPERL_REF=release-1-6-924

ENV DEBIAN_FRONTEND=noninteractive \
    ENSEMBL_HOME=/opt/ensembl \
    PERL_MM_USE_DEFAULT=1 \
    PERL5LIB=/opt/ensembl/bioperl-1.6.924:/opt/ensembl/ensembl/modules:/opt/ensembl/ensembl-analysis/modules:/opt/ensembl/ensembl-genes/src/perl \
    PATH=/opt/ensembl/venv/bin:${PATH} \
    PYTHONPATH=/opt/ensembl/ensembl-genes/src/python

WORKDIR /opt/ensembl

RUN apt-get update && apt-get install -y --no-install-recommends \
        build-essential \
        ca-certificates \
        cpanminus \
        curl \
        default-mysql-client \
        git \
        libbz2-dev \
        libbio-db-hts-perl \
        libdbd-mysql-perl \
        libdbi-perl \
        libexpat1-dev \
        libhts-dev \
        liblzma-dev \
        libncurses5-dev \
        libssl-dev \
        libxml2-dev \
        perl \
        pkg-config \
        unzip \
        wget \
        zlib1g-dev \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt /tmp/requirements.txt

RUN python -m venv /opt/ensembl/venv \
    && /opt/ensembl/venv/bin/pip install --upgrade pip setuptools wheel \
    && /opt/ensembl/venv/bin/pip install --no-cache-dir -r /tmp/requirements.txt

RUN curl -fsSL -o /tmp/bioperl.zip \
        "https://github.com/bioperl/bioperl-live/archive/refs/tags/${BIOPERL_REF}.zip" \
    && unzip -q /tmp/bioperl.zip -d /opt/ensembl \
    && mv /opt/ensembl/bioperl-live-${BIOPERL_REF} /opt/ensembl/bioperl-1.6.924 \
    && rm -f /tmp/bioperl.zip

RUN git clone --depth 1 --branch "${ENSEMBL_REF}" https://github.com/Ensembl/ensembl.git \
    && git clone --depth 1 --branch "${ANALYSIS_REF}" https://github.com/Ensembl/ensembl-analysis.git \
    && git clone --depth 1 --branch "${GENES_REF}" https://github.com/Ensembl/ensembl-genes.git

RUN set -eux; \
    for repo in ensembl ensembl-analysis ensembl-genes; do \
        if [ -f "/opt/ensembl/${repo}/cpanfile" ]; then \
            cd "/opt/ensembl/${repo}"; \
            cpanm --notest --installdeps .; \
        fi; \
    done

CMD ["bash"]
