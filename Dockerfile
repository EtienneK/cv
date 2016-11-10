FROM ubuntu
RUN apt-get update -y && apt-get install -y texlive texlive-latex-extra tex-gyre
RUN mkdir /cv
WORKDIR /cv
VOLUME /cv

CMD make

