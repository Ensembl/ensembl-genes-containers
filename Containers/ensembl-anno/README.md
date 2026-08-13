# ensembl-anno-dev container

Preview container for the Ensembl Anno annotation pipeline. The code is still development only as a package and expose the ensembl-anno command or the single modules command CLI:


Examples:

```bash
docker run --rm IMAGE run_repeatmasker --help
```
For the available commands please visit [the Ensembl Anno documentation](https://ensembl.github.io/ensembl-anno/).

This is a preview/development image intended to support workflow integration
for the repeat pipeline in ensembl-genes-nf.
