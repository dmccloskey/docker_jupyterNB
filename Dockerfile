# Dockerfile to build jupyter notebook containers
# Based on Ubuntu

# Set the base image
FROM dmccloskey/python3scientific:latest

# Metadata
LABEL maintainer Douglas McCloskey <dmccloskey87@gmail.com

# Switch to root for installation
USER root

# Create directories and volumes
RUN mkdir /home/user/workspace_notebooks \
	&& mkdir /home/user/workspace_data \
	&& mkdir /home/user/settings
VOLUME /home/user/workspace_notebooks \
	/home/user/workspace_data \
	/home/user/settings
	
# Add the script for running ipython notebooks
WORKDIR /home/user/workspace_notebooks
ADD scripts/run_ipython.sh /home/user/workspace_notebooks/run_ipython.sh

EXPOSE 8888

WORKDIR $HOME/workspace_notebooks
USER user

ENTRYPOINT ["bash","/home/user/workspace_notebooks/run_ipython.sh"]
#docker run -p 8888:8888 \
#	-v /home/douglas/Documents/Dockerbuild_sbaas/settings/settings_metabolomics_docker.ini:/home/user/settings/settings_metabolomics_docker.ini \
#	-v /home/douglas/Documents/Dockerbuild_sbaas/visualization_resources/:/home/user/visualization_resources/  
#	-it -e "PASSWORD=metabolomics" dmccloskey/docker-jupyternb
