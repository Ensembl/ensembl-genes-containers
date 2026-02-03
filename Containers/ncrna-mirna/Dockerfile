FROM python:3.6-slim

COPY data/* data/
ADD https://github.com/Ensembl/ensembl-analysis/raw/main/scripts/genebuild/sncrna/FilterDafs.py .

RUN /usr/local/bin/python3 -m pip install pandas==0.19.2 \
  && /usr/local/bin/python3 -m pip install numpy==1.17.5 \
  && /usr/local/bin/python3 -m pip install scikit-learn==0.18.1 \
  && /usr/local/bin/python3 -m pip install scipy==0.18.1 \
  && /usr/local/bin/python3 -m pip cache purge

CMD ["/usr/local/bin/python3", "FilterDafs.py", "data/filter_dafs_rfc_model_human.pkl", "data/filter_dafs_rfc_scaler_human.pkl", "/data_files", "/data_files/annotated_dafs.tsv", "/data_files/rna_fold_results.txt", "/data_files/identified_mirnas.bed", "/data_files/mirnas_to_delete.txt"]
