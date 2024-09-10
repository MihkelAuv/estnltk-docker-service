FROM continuumio/miniconda3 AS build

COPY conda_environment.yml .
RUN conda env create -f conda_environment.yml

RUN conda install -c conda-forge conda-pack

RUN conda-pack -n estnltk -o /tmp/env.tar && \
  mkdir /venv && cd /venv && tar xf /tmp/env.tar && \
  rm /tmp/env.tar

RUN /venv/bin/conda-unpack


FROM debian:bookworm-slim AS runtime

COPY --from=build /venv /venv

WORKDIR /app

COPY service.py .
COPY boot.sh .

RUN chmod +x boot.sh

RUN echo "source /venv/bin/activate" > ~/.bashrc
ENV PATH=/venv/bin:$PATH

RUN [ "python3", "-c", "import nltk; nltk.download('punkt_tab', download_dir='/root/nltk_data')" ]

EXPOSE 5000

ENTRYPOINT ["./boot.sh"]
