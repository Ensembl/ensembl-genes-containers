# ensembl-genes-qc-dev container

Preview container for the annotation QC work currently living on the
`feature/annotation-qc` branch of `ensembl-genes`.

This image is intentionally separate from the stable `ensembl-genes` image. It
bundles:

- the `feature/annotation-qc` branch checkout of `Ensembl/ensembl-genes`
- Python dependencies needed for the QC parsing code

The image is development-only, but exposes the package-owned QC CLI:

```bash
annotation-qc <command> [args...]
```

Available commands:

- `parse-agat`
- `parse-interpro`

Examples:

```bash
docker run --rm IMAGE annotation-qc --help
docker run --rm IMAGE annotation-qc parse-agat --help
docker run --rm IMAGE annotation-qc parse-interpro --help
```

This is a preview/development image intended to support workflow integration
for the QC parsing layer while the QC interface is stabilised in
`ensembl-genes`. AGAT itself should remain a separately versioned tool image.
