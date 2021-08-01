FROM sagemath/sagemath:9.3.beta6

LABEL maintainer="kaisong39@gmail.com"
USER root
RUN sudo apt-get update -y && \
    sudo apt-get install -y libgmp3-dev libmpc-dev git python-pip && \
    git clone https://github.com/Ganapati/RsaCtfTool.git

WORKDIR RsaCtfTool

RUN sage -sh -c 'pip install -r requirements.txt -r optional-requirements.txt'
RUN sage -sh -c 'pip install libnum'
COPY entrypoint.sh /opt
RUN chmod +x /opt/entrypoint.sh
ENTRYPOINT [ "/opt/entrypoint.sh" ]