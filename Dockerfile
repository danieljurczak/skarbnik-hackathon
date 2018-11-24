FROM python:3
ENV PYTHONUNBUFFERED 1
RUN mkdir /skarbnik-hackathon
WORKDIR /skarbnik-hackathon
ADD requirements.txt /skarbnik-hackathon/
RUN pip install -r requirements.txt
ADD . /skarbnik-hackathon/