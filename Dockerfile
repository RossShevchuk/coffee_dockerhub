# syntax=docker/dockerfile:1

# base python image for custom image
FROM python:3.9.13-slim-buster

RUN pip install --upgrade pip

# create working directory and install pip dependencies
WORKDIR /git-dockerhub
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

# copy python project files from local to /git-docker-aws image working directory
COPY . .
ENV FLASK_APP=main.py

EXPOSE 5000

# run the flask server
#CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0:5000"]
CMD ["python3", "main.py"]
