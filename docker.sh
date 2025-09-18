sudo apt update && sudo apt install -y dos2unix wget && \
wget https://raw.githubusercontent.com/Avinashtok/docker-install/main/install_docker_full.sh && \
dos2unix install_docker_full.sh && chmod +x install_docker_full.sh && sudo ./install_docker_full.sh && \
sudo systemctl enable --now docker && sudo usermod -aG docker $USER && newgrp docker && docker run hello-world
