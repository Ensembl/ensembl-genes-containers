# MirMachine

Container for the MirMachine development revision used by the Ensembl Genes
MIR-12 Lepidoptera analysis.

The image starts from the public BioContainer for MirMachine `0.3.0.3` and
reinstalls MirMachine from the development commit needed for the long hairpin
option:

```text
14e33308cbeaed495c24254f60bd8c52232d7b2e
```

Build locally:

```bash
docker build -t ensemblorg/mirmachine:development-14e3330 .
```

Run:

```bash
docker run --rm ensemblorg/mirmachine:development-14e3330 --help
```

Use with Apptainer/Singularity:

```bash
apptainer pull docker://ensemblorg/mirmachine:development-14e3330
```
