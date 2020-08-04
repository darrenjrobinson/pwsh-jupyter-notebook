FROM tlinnet/csharp-notebook

#Working Directory
WORKDIR $HOME

ARG NB_USER=jovyan
ARG NB_UID=1000
ENV USER ${NB_USER}
ENV NB_UID ${NB_UID}
ENV HOME /home/${NB_USER}

WORKDIR ${HOME}

USER root

# PowerShell
RUN wget -q https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb
RUN dpkg -i packages-microsoft-prod.deb 
RUN apt-get update
RUN apt-get install -y powershell

# Dot Net SDK 
RUN apt-get install -y apt-transport-https && sudo apt-get update && sudo apt-get install -y dotnet-sdk-3.1 
# Install lastest build from master branch of Microsoft.DotNet.Interactive from myget
RUN dotnet tool install -g Microsoft.dotnet-interactive --version 1.0.140402 --add-source "https://dotnet.myget.org/F/dotnet-try/api/v3/index.json"

# Copy startup script
COPY ./config/start-jupyternotebook.sh ${HOME}

RUN chown -R ${NB_UID} ${HOME}
USER ${USER}

RUN chmod 644 ${HOME}/start-jupyternotebook.sh

#Install nteract 
RUN pip install nteract_on_jupyter

ENV PATH="${PATH}:${HOME}/.dotnet/tools"
RUN echo "$PATH"

# Install kernel specs
RUN dotnet interactive jupyter install

# Enable telemetry once we install jupyter for the image
ENV DOTNET_TRY_CLI_TELEMETRY_OPTOUT=false

# Set root to Home 
WORKDIR ${HOME}/

