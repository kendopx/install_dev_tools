```sh
### Mac OS

###################################################################################################
#
#  - If you're using a Mac, follow these instructions to run the script.
#  - With MAC, by default you can use Linux and Zsh or Bash command-line tools directly.
#
###################################################################################################

### Step 1. Install brew using the following command
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

### Step 2. Set command path for brew
eval "$(homebrew/bin/brew shellenv)"
brew update --force --quiet
chmod -R go-w "$(brew --prefix)/share/zsh"

### Step 3. Clone the repository and run the command below
git clone https://github.com/kendopx/install_dev_tools.git
cd install_dev_tools
ls -lrt 

### Step 4. Run the script to install the development tools. (usually takes a few minutes)
./install_mac_dev_tools.sh

### Windows system

###################################################################################################
#
#  - If you're using a Windows, follow these instructions to run the script.
#  - To install Linux on Windows with WSL
#  - Developers can access the power of both Windows and Linux at the same time on a Windows machine.
#  - The Windows Subsystem for Linux (WSL) lets developers install a Linux distribution 
#  - With Ubuntu, you can use Linux and Zsh or Bash command-line tools directly on Windows.
#
###################################################################################################

### Step 1. As administrtor, launch Powershell on Windows

### Step 2. Install WSL on Windows via Powershell terminal 
wsl --install 

### Note it would take few min. Once the install is complete you will be prompted to restart or reboot your laptop 

### Step 3. Upon restarting your laptop, you will be asked to create a username and password, such as:
username: swilliams
password: swilliams123!

### Step 4. From the Ubuntu terminal, clone the repository and run the command below:
git clone https://github.com/kendopx/install_dev_tools.git
cd install_dev_tools
ls -lrt 

### Step 5. Run the script to install the development tools. (usually takes a few minutes)
./install_ubuntu_dev_tools.sh
