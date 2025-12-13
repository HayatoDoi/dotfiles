docker run -d \
    --name dev-linux \
    --restart always \
    -p 2222:22 \
    -v $HOME/Develop:/home/devuser/Develop \
    dev-linux:latest
