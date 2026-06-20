FROM python:3.11-slim

WORKDIR /app

RUN pip install jupyter notebook

EXPOSE 8888

RUN mkdir -p /app/notebooks

CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--allow-root", "--notebook-dir=/app/notebooks", "--NotebookApp.token=", "--NotebookApp.password="]
