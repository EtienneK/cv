FROM ubuntu
RUN apt-get update -y && apt-get install -y texlive texlive-latex-extra tex-gyre
RUN apt-get install -y build-essential
RUN apt-get install -y python
RUN apt-get install -y pandoc
RUN apt-get install -y lmodern
RUN mkdir /cv
WORKDIR /cv
VOLUME /cv

CMD make

