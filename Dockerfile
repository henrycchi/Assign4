FROM python:latest
LABEL maintainer = "hcc2045@nyu.edu"

LABEL build_date = "2019-12-12"
RUN apt-get update -y && \
    apt-get upgrade -y

RUN git clone https://github.com/henrycchi/Assign4.git

WORKDIR /app/

RUN pip install --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

EXPOSE 8080
CMD [ "gunicorn", "app:this_app", "--bind", "0.0.0.0:8080", "--workers", "5" ]
