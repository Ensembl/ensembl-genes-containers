# CPC2 Docker image

Dockerfile and commands to create the STAR Docker image and run it as a Singularity (tag 1.0.1).

Links:
[source code](https://github.com/alexdobin/STAR),
[publication](https://pubmed.ncbi.nlm.nih.gov/23104886/),
[manual](https://github.com/alexdobin/STAR/blob/master/doc/STARmanual.pdf)

Docker image at Docker Hub:
https://hub.docker.com/r/ebileanne/star


## Build and run the Docker image

Build the Docker image locally, using the Dockerfile
```
docker image build -t ebileanne/star:latest .
```
or pull the existing image from DockerHub 
```
docker pull ebileanne/star
```

Run the image (see [manual](https://github.com/alexdobin/STAR/blob/master/doc/STARmanual.pdf) to set up the command for STAR)
```
docker -v <working_dir> run ebileanne/star:latest STAR 
```

## Run the Docker image as a  Singularity 

Pull the Docker image from DockerHub in the `/hps/software/users/ensembl/genebuild/$USER/singularity` directory, it will be saved as a Singularity image
```
singularity pull docker://ebileanne/star:latest
```

Run STAR using Singularity
```
singularity exec /hps/software/users/ensembl/genebuild/$USER/singularity/star_latest.sif STAR
```
