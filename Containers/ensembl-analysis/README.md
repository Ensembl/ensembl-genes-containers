# ensembl-analysis container

Container for the Ensembl Perl API and analysis scripts used by the legacy
statistics pipeline, including `dump_translations.pl`.

This image is intended to be the runtime boundary for workflows that need a
real Ensembl core database connection and the legacy analysis stack.

Default build refs:

- `ENSEMBL_REF=release/116`
- `ANALYSIS_REF=main`
- `GENES_REF=main`

Typical use:

```bash
docker run --rm IMAGE bash
```
