# ensembl-genes-qc-dev container

Preview container for the QC work currently living on the `feature/run_metrics`
branch of `ensembl-genes`.

This image is intentionally separate from the stable `ensembl-genes` image. It
bundles:

- the `feature/run_metrics` branch checkout of `Ensembl/ensembl-genes`
- Python dependencies needed for the QC parsing code

It exposes a small dispatcher:

```bash
ensembl-genes-qc-dev <command> [args...]
```

Available commands:

- `parse-agat`
- `paths`

Examples:

```bash
docker run --rm IMAGE help
docker run --rm IMAGE paths
docker run --rm -v "$PWD:$PWD" -w "$PWD" IMAGE parse-agat --help
```

This is a preview/development image intended to support workflow integration
for the QC parsing layer while the QC interface is stabilised in
`ensembl-genes`. AGAT itself should remain a separately versioned tool image.
