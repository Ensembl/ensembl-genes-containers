# ensembl-genes container

Stable container for CLI tools from the `ensembl-genes` `main` branch.

This image installs the Python package from `Ensembl/ensembl-genes` and exposes
the currently supported console scripts through a single dispatcher command:

```bash
ensembl-genes <command> [args...]
```

Examples:

```bash
docker run --rm IMAGE help
docker run --rm IMAGE list
docker run --rm IMAGE check_busco_score --help
docker run --rm IMAGE start_pipeline_from_registry --help
```

Build arguments:

- `ENSEMBL_GENES_REPO`: git repository to clone
- `ENSEMBL_GENES_REF`: branch, tag, or ref to build from. Defaults to `main`

This image is intended to become the stable runtime boundary for released
`ensembl-genes` commands consumed by workflows.
