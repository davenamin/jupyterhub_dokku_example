FROM jupyterhub/jupyterhub:latest

RUN pip install oauthenticator

RUN pip install jupyter

ADD jupyterhub_config.py /srv/jupyterhub/jupyterhub_config.py

EXPOSE 8000
