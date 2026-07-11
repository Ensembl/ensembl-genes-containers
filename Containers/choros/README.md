# ChOROS

Runtime for [ChOROS](https://github.com/lareaulab/choros), used by the
Ensembl Ribo-seq pipeline for per-sample correction of sequence-dependent
ligation and digestion biases in codon-level ribosome-footprint counts.

The image pins upstream commit:

```text
23d3e424f782d7b729d0c07989096cd00d6fa486
```

ChOROS declares `knitr` and `rmarkdown` as runtime dependencies even though
they are only needed to build its vignette. The Docker build removes those two
entries from the pinned package metadata before installation; the analysis
code is unchanged.

Build and test locally:

```bash
docker build -t choros:test Containers/choros
docker run --rm choros:test
docker run --rm choros:test Rscript -e \
  'stopifnot(requireNamespace("choros"), requireNamespace("MASS")); sessionInfo()'
```

The GitLab mirror CI publishes the image as both `latest` and the container
repository commit SHA. Production Nextflow configurations should use the
immutable commit-SHA tag.
