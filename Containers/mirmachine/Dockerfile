FROM quay.io/biocontainers/mirmachine:0.3.0.3--pyhdfd78af_0


LABEL maintainer="dev@ensembl.org"
LABEL org.opencontainers.image.title="mirmachine"
LABEL org.opencontainers.image.description="MirMachine development build for Ensembl Genes MIR-12 analysis"
LABEL org.opencontainers.image.source="https://github.com/sinanugur/MirMachine"
LABEL org.opencontainers.image.revision="14e33308cbeaed495c24254f60bd8c52232d7b2e"

ARG MIRMACHINE_REPO=https://github.com/sinanugur/MirMachine.git
ARG MIRMACHINE_REF=14e33308cbeaed495c24254f60bd8c52232d7b2e

RUN python -m pip install --no-cache-dir --no-deps --force-reinstall \
    "${MIRMACHINE_REPO%".git"}/archive/${MIRMACHINE_REF}.tar.gz"

WORKDIR /work

ENTRYPOINT ["MirMachine.py"]
CMD ["--help"]
