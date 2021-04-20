FROM centos:centos8
RUN dnf update -y; dnf install git unzip dnf python38 -y; dnf groupinstall "Development Tools" -y
RUN dnf module install nodejs -y; npm install --global yarn -y
RUN dnf module reset nodejs -y; dnf module install nodejs:10 -y;
RUN useradd -m -d /develop developer
USER developer
WORKDIR /develop
RUN git clone https://github.com/elastic/kibana.git
WORKDIR /develop/kibana
RUN git checkout tags/v7.10.2 -b v7.10.2
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash; 
RUN . $HOME/.bashrc; nvm install 10.23.1
RUN . $HOME/.bashrc; nvm use
RUN . $HOME/.bashrc; yarn kbn bootstrap
COPY scripts/*.sh /develop/
VOLUME /develop/kibana/plugins


CMD /bin/bash
