docker run -d \
  -v /home/$USER/pipelines:/app/pipelines \
  -p 9099:9099 \
   --add-host=host.docker.internal:host-gateway  \
  -e PIPELINES_API_KEY=0p3n-w3bu! \
  --name open-webui-pipelines \
  --restart always \
  ghcr.io/open-webui/pipelines:main
