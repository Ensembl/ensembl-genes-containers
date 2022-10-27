# miRNA filter
This image create a container to filter miRNAs which have been aligned to a genome using BLAST

DockerHub: https://hub.docker.com/r/ensemblorg/ncrna-mirna

## Build the docker image
You can build the Docker image locally
```
docker build -t ncrna-mirna:latest .
```

or you cn get the image from DockerHub
```
docker pull ensemblorg/ncrna-mirna:latest
```


## Run the docker image
```
docker run --mount type=bind,source=<full path to ncrna data dump>,target=/data_files ensemblorg/ncrna-mirna:latest
```
The source path is usually created by the Ensembl Annotation System using the scientific name, the genome assembly accession and 'ncrna': `<workdir>/<scientific_name>/GCA_XXXXX.X/ncrna`

## Use Singularity
On some HPC you may want to use [Singularity](https://docs.sylabs.io/guides/3.0/user-guide/index.html) in a local cache
```
singularty pull docker://ensemblorg/ncrna-mirna
```

Then you can excute the image
```
bsub -o log.out "singularity exec --bind <full path to ncrna data dump>:/data_files:rw /hps/software/users/ensembl/genebuild/$USER/singularity/ncrna-mirna.sif"
```
