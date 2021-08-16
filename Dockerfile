FROM continuumio/miniconda3

WORKDIR /app

COPY conda_environment.yml .
COPY service.py .
COPY boot.sh .

RUN chmod +x boot.sh

RUN conda env create -f conda_environment.yml

RUN echo "source activate estnltk" > ~/.bashrc
ENV PATH /opt/conda/envs/estnltk/bin:$PATH

EXPOSE 5000

ENTRYPOINT ["./boot.sh"]
