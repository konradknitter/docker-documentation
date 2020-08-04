# base image
FROM ubuntu:20.04

ENV TZ=America/New_York
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
# Used by GitLab
    git \1
# Used for Static Analysis
    python3 \
    plantuml \
    texlive \
    texlive-latex-recommended \
    texlive-fonts-recommended \
    texlive-latex-extra \
    texlive-font-utils \
    make \
 # More documentation tools
    default-jre \
    sphinx-common \
    python3-pip \
    latexmk \
# Clean apt cache
&& rm -rf /var/lib/apt/lists/* \
&& ln -s /usr/lib/llvm-6.0/lib/libclang.so.1 /usr/lib/libclang.so

RUN pip3 install -U sphinx
RUN pip3 install sphinxcontrib_plantuml
RUN pip3 install sphinxcontrib-confluencebuilder
RUN pip3 install sphinxcontrib-svg2pdfconverter
RUN pip3 install cairosvg

CMD ["/bin/bash"]
