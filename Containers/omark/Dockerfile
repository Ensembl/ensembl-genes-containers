FROM quay.io/biocontainers/omark:0.4.1--pyh7e72e81_0

LABEL org.opencontainers.image.title="omark"
LABEL org.opencontainers.image.description="Patched OMArk 0.4.1 image with NumPy pinned below 2.4 for numba compatibility"

USER root

RUN python -m pip install --no-cache-dir --force-reinstall "numpy<2.4"

WORKDIR /work

ENTRYPOINT ["omark"]
CMD ["--help"]