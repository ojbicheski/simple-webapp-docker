FROM ubuntu:16.04

RUN apt-get update && apt-get upgrade
RUN apt-get install -y  wget build-essential libreadline-gplv2-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev libffi-dev zlib1g-dev python3 python3-pip python3-pycurl curl

RUN wget https://www.python.org/ftp/python/3.10.8/Python-3.10.8.tgz
RUN tar xzf Python-3.10.8.tgz 
RUN cd Python-3.10.8
RUN chmod 755 configure 
RUN ./configure --enable-optimizations
RUN make altinstall 

RUN curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py"
RUN python3 get-pip.py
RUN pip -V

RUN pip install flask 

COPY app.py /opt/

ENTRYPOINT FLASK_APP=/opt/app.py flask run --host=0.0.0.0 --port=8080
