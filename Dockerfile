FROM ubuntu:16.04

RUN apt-get update && apt-get install -y python3 python3-pip

RUN apt-get update && apt-get install -y curl
RUN curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py"
RUN python3 get-pip.py
RUN pip -V

RUN pip install flask 

COPY app.py /opt/

ENTRYPOINT FLASK_APP=/opt/app.py flask run --host=0.0.0.0 --port=8080
