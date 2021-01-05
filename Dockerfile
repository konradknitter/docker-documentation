# base image
FROM ubuntu:20.04

ENV TZ=America/New_York
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
# Used by GitLab
    wget \
    curl \
    git \
# Used for Static Analysis
    python3 \
    texlive \
    graphviz \
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
    subversion \
    librsvg2-bin \
# Clean apt cache
&& rm -rf /var/lib/apt/lists/* \
&& ln -s /usr/lib/llvm-6.0/lib/libclang.so.1 /usr/lib/libclang.so

RUN pip3 install -U sphinx
RUN pip3 install sphinxcontrib_plantuml
RUN pip3 install sphinxcontrib-svg2pdfconverter
RUN pip3 install sphinxcontrib-confluencebuilder
RUN pip3 install cairosvg
RUN pip3 install docxbuilder
RUN pip3 install sphinx-csv-filter

RUN wget -O /bin/plantuml.jar https://deac-ams.dl.sourceforge.net/project/plantuml/plantuml.jar
RUN alias plantuml='java -jar /bin/plantuml.jar'

CMD ["/bin/bash"]
