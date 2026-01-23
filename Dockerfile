FROM continuumio/miniconda3:latest

WORKDIR /opt/notebooks

RUN conda create -n nlp python=3.10 -y
RUN conda install -n nlp jupyter ipykernel -y

RUN conda run -n nlp python -m ipykernel install \
    --user \
    --name nlp \
    --display-name "Python (nlp)"

EXPOSE 8888

CMD ["conda", "run", "-n", "nlp", "jupyter", "notebook", "--notebook-dir=/opt/notebooks", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root", "--NotebookApp.token=", "--NotebookApp.password="]
