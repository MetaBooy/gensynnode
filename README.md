# gensynnode

# STEP1
Install docker
```
curl -fsSL https://gist.githubusercontent.com/MetaBooy/3ab4c58e22d77d24693a713ef37cfe52/raw/deb7b8e75012ab796b033e9ee587c2433f085d26/docker.sh && chmod +x install_docker.sh && ./install_docker.sh
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
wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.tgz
tar -xvzf ngrok-stable-linux-amd64.tgz
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
