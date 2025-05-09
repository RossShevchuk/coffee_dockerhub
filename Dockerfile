# syntax=docker/dockerfile:1

# base python image for custom image
FROM python:3.9.13-slim-buster

# create working directory and install pip dependencies
WORKDIR /git-dockerhub
COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

# copy python project files from local to /git-docker-aws image working directory
COPY . /git-dockerhub
ENV FLASK_APP=main.py


EXPOSE 80

# run the flask server
CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]
#CMD ["python3", "main.py"]
