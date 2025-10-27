# gensynnode

# STEP1
Install docker
```
#!/bin/bash

# ---------------------------------
# ✅ STEP 1: System Update
# ---------------------------------
sudo apt update && sudo apt upgrade -y

# ---------------------------------
# ✅ STEP 2: Install Dependencies
# ---------------------------------
sudo apt install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release \
    software-properties-common

# ---------------------------------
# ✅ STEP 3: Add Docker GPG Key
# ---------------------------------
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
    sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# ---------------------------------
# ✅ STEP 4: Add Docker Repository
# ---------------------------------
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] \
https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | \
sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# ---------------------------------
# ✅ STEP 5: Install Docker
# ---------------------------------
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io

# ---------------------------------
# ✅ STEP 6: Enable Docker on Boot
# ---------------------------------
sudo systemctl enable docker

# ---------------------------------
# ✅ STEP 7: Add Current User to docker Group
# ---------------------------------
sudo usermod -aG docker $USER

# ---------------------------------
# ✅ STEP 8: Verify Docker Installation
# ---------------------------------
docker --version && echo "✅ Docker installed successfully"

# ---------------------------------
# ✅ STEP 9: (Optional) Hello World Test
# ---------------------------------
# docker run --rm hello-world

# ---------------------------------
# ✅ STEP 10: Create Idle Container
# ---------------------------------
docker run -d --restart=always --name gensyn-container busybox sleep 9999999

# ---------------------------------
# ✅ STEP 11: Install screen (Optional)
# ---------------------------------
sudo apt install -y screen

# ---------------------------------
# ✅ STEP 12: Use screen for Background Session
# ---------------------------------
# Start screen:
# screen -S swarm
# Run inside screen:
# docker run -d --name swarm busybox sleep 9999999
# Detach: Press Ctrl + A then D
# Reattach later: screen -r swarm

# ---------------------------------
# ✅ STEP 13: Auto-Restart Policy (Recommended)
# ---------------------------------
# Set restart policy without recreating:
docker update --restart=always gensyn-container

# To verify:
docker inspect gensyn-container --format='{{.HostConfig.RestartPolicy.Name}}'
# Output should be: always

# ---------------------------------
# ✅ EXTRA: Reboot Fix (If docker fails to start)
# ---------------------------------
# sudo systemctl stop docker.socket
# sudo systemctl stop docker
# sudo rm -f /var/run/docker.pid
# sudo systemctl start docker
# sudo systemctl status docker
```

# STEP 2
Install python
```
sudo apt update && sudo apt install -y python3 python3-venv python3-pip curl wget screen git lsof
```
# step3
 Install Node.js and Yarn
 ```
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt install -y nodejs

curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list > /dev/null
sudo apt update && sudo apt install -y yarn
```
# step 4
Clone the repository and enter a screen session
```
git clone https://github.com/gensyn-ai/rl-swarm.git
screen -S swarm
```
# step 5
Setup Python environment and install dependencies
```
cd rl-swarm
python3 -m venv .venv
source .venv/bin/activate
cd modal-login
cd ..

git switch main
git reset --hard
git clean -fd
git pull origin main

pip install --force-reinstall transformers==4.51.3 trl==0.19.1
pip freeze
```
# step 6
Start the swarm
```
./run_rl_swarm.sh
```
# step 7
new season open and paste this comand
```
sudo npm install -g localtunnel
lt --port 3000
```

# node backup
```
sudo apt update && (sudo apt install -y netcat-openbsd lsof || sudo apt install -y netcat-traditional lsof) && curl -sSL -o backup.sh https://raw.githubusercontent.com/MetaBooy/gensynnode/refs/heads/main/backup && chmod +x backup.sh && ./backup.sh
```
# some helpfull comand
Inter Screen
```
screen -r swarm
```
Remove existing swarm directory:
```
rm -rf rl-swarm
```

# if step 7 not workinfg then try it 
```
wget https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz
tar -xvzf ngrok-v3-stable-linux-amd64.tgz
sudo mv ngrok /usr/local/bin/

```
then 
```
ngrok authtoken 32NEofQU8RUFa1PdHFEPeihS6bY_3V6nNJk756jLt7p9eeA9w

```
then 
```
ngrok http 3000
```
## dlt screen comand 
```
screen -X -S <session_name_or_id> quit
```
