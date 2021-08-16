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

#SHELL ["conda", "run", "-n", "estnltk", "/bin/bash", "-c"]

#RUN echo "Make sure flask is installed:"
#RUN python -c "import flask"



#ENTRYPOINT ["conda", "run", "--no-capture-output", "-n", "estnltk", "python", "service.py"]