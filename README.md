# PowerShell Jupyter Notebook

[Associated Blogpost](https://blog.darrenjrobinson.com/docker-powershell-jupyter-notebook-environments/)

## Binder PowerShell Jupyter Notebook
Click on the Binder logo below to start this Docker PowerShell Jupyter image on Binder 
[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/darrenjrobinson/pwsh-jupyter-notebook/master)

## Build Locally
Build the Docker Image locally;
* Clone this repo
* cd/ to the location you put the Dockerfile 
* docker build --tag darrenjrobinson/pwsh-jupyter-notebook .

### Run the Docker Container
Run the Docker Container Image
* docker run -it --rm -p 8888:8888 -v "%CD%":/home/jovyan/work darrenjrobinson/pwsh-jupyter-notebook:latest bash ./start-jupyternotebook.sh
* navigate to the URL provided in the console

## Keep up to date
* ![](https://i1.wp.com/blog.darrenjrobinson.com/wp-content/uploads/2017/02/cropped-WPSiteIcon.jpg?fit=16%2C16&ssl=1) [Visit my blog](https://darrenjrobinson.com)
* ![](http://twitter.com/favicon.ico) [Follow darrenjrobinson](https://twitter.com/darrenjrobinson)

