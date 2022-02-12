#!/bin/bash
set -e

VAGRANT_USER_PASS=vagrant
VAGRANT_HOME=/home/vagrant

sudo dnf upgrade -y
sudo dnf group install -y "Fedora Workstation" "i3 desktop" "C Development Tools and Libraries" "Python Science"
sudo systemctl set-default graphical.target
#sudo systemctl disable lightdm.service
#sudo systemctl enable gdm.service
sudo dnf install -y git vim neovim zsh kitty wget podman podman-compose skopeo buildah python3-pip python3.8 \
    poetry nodejs npm golang gnome-tweaks gnome-extensions-app alacarte origin-clients helm gparted sqlite \
    xset jq sysstat ripgrep

# Configure GITHUB client https://github.com/cli/cli"
sudo dnf config-manager --add-repo https://cli.github.com/packages/rpm/gh-cli.repo
sudo dnf install -y gh

# Install VSCode
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
dnf check-update
sudo dnf install code -y

# Configure spanish keyboard layout for gnome
gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'es')]"

# I3 window mannager setup
sudo dnf install -y i3status i3blocks wget dmenu rofi i3lock xbacklight feh conky lxappearance arc-theme fontawesome-fonts \
    powerline powerline-fonts fira-code-fonts
pip install bumblebee-status # Bar mannager for i3
sudo timedatectl set-timezone Europe/Madrid

# Configure Neovim with vim-plug (https://github.com/junegunn/vim-plug)
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Install custom dotfiles
cd ${HOME} && git clone https://github.com/cristiancl25/dotfiles
./dotfiles/install.sh

cd /opt

#echo "GOLANG https://golang.org/dl/"
#GOLANG_VERSION=1.15.8
#GOLANG_TAR_URL="https://golang.org/dl/go${GOLANG_VERSION}.linux-amd64.tar.gz"
#sudo wget ${GOLANG_TAR_URL} &> /dev/null
#sudo tar -zxf $(basename $GOLANG_TAR_URL)
#sudo rm $(basename $GOLANG_TAR_URL)
#GOROOT=/opt/$(ls | grep go | head -1)
export GOPATH=${VAGRANT_HOME}/go

# Install yq from go source
GO111MODULE=on go get github.com/mikefarah/yq/v4

#echo "KIND https://kind.sigs.k8s.io/"
#GO111MODULE="on" go get -v sigs.k8s.io/kind@v0.11.1
# Alternative to KIND for kubernetes local: https://github.com/k3s-io/k3s

echo "JDK 11 https://adoptopenjdk.net/"
JDK_TAR_URL=https://github.com/AdoptOpenJDK/openjdk11-binaries/releases/download/jdk-11.0.10%2B9/OpenJDK11U-jdk_x64_linux_hotspot_11.0.10_9.tar.gz
sudo wget ${JDK_TAR_URL} &> /dev/null
sudo tar -zxf $(basename $JDK_TAR_URL)
sudo rm $(basename $JDK_TAR_URL)
JAVA_HOME=/opt/$(ls | grep jdk | head -1)

echo "MAVEN https://maven.apache.org/download.cgi"
MAVEN_VERSION=3.6.3
MAVEN_TAR_URL=https://ftp.cixug.es/apache/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz
sudo wget ${MAVEN_TAR_URL} &> /dev/null
sudo tar -zxf $(basename $MAVEN_TAR_URL)
sudo rm $(basename $MAVEN_TAR_URL )
MAVEN_HOME=/opt/$(ls | grep maven | head -1)

echo "SPARK https://spark.apache.org/"
SPARK_VERSION=3.1.2
SPARK_TAR_URL=https://ftp.cixug.es/apache/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-hadoop3.2.tgz
sudo wget ${SPARK_TAR_URL} -q
sudo tar -zxf $(basename $SPARK_TAR_URL)
sudo rm $(basename $SPARK_TAR_URL)
SPARK_HOME=/opt/$(ls | grep spark | head -1)

# Nvm and node install
export PROFILE=$HOME/.zshrc
#export NODE_VERSION=16.3.0
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
# Install latest version of node
#nvm install node
#nvm use node

# Install Oh My ZSH and set as default shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo "$VAGRANT_USER_PASS" | chsh -s $(which zsh)

# Sets default plugins for oh my zsh
sed -i '/plugins=/s/.*/plugins=(git oc kubectl gh)/' ${HOME}/.zshrc

cat <<-EOFILE > "/sharedfs/vagrant_env.sh"
#!/bin/bash
#export GOROOT=${GOROOT}
export GOPATH=${GOPATH}
export JAVA_HOME=${JAVA_HOME}
export MAVEN_HOME=${MAVEN_HOME}
export SPARK_HOME=${SPARK_HOME}
export PATH=\${GOPATH}/bin:\${JAVA_HOME}/bin:\${MAVEN_HOME}/bin:\${SPARK_HOME}/bin:\${HOME}/.local/bin:\${PATH}

alias p=podman
alias pc=podman-compose
alias docker=podman
alias cr="clear && reset"
EOFILE
chmod +x /sharedfs/vagrant_env.sh

echo "source /sharedfs/vagrant_env.sh" >> ${VAGRANT_HOME}/.zshrc

sudo reboot
