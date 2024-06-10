FROM mambaorg/micromamba:1.5.8
USER root
RUN apt-get update && apt-get install -y \
    curl \
    && rm -rf /var/lib/apt/lists/*
USER mambauser

COPY --chown=$MAMBA_USER:$MAMBA_USER environment.yaml /tmp/env.yaml
RUN micromamba install -y -n base -f /tmp/env.yaml && \
    micromamba clean --all --yes
COPY --chmod=755 run.sh /tapis/run.sh
COPY --chown=$MAMBA_USER:$MAMBA_USER main.py /code/main.py
ENV PATH="/opt/conda/bin:${PATH}"
ENV PATH "/code:$PATH"
ENTRYPOINT [ "/tapis/run.sh" ]
