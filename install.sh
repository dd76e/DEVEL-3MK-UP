#!/bin/bash
clear

# Define colors
RED='\e[31m'
CYAN='\e[36m'
NC='\e[0m'

echo ""
echo -e "${RED}          _    _            _               _____            ${NC}"
echo "         | |                                                          "
echo "         |   "
echo "         |   "                        
echo "         ____  _______     _______ _       _____ __  __ _  __"
echo "        |  _ \| ____\ \   / / ____| |     |___ /|  \/  | |/ /"
echo "        | | | |  _|  \ \ / /|  _| | |       |_ \| |\/| | ' / "
echo "        | |_| | |___  \ V / | |___| |___   ___) | |  | | . \ "
echo "        |____/|_____|  \_/  |_____|_____| |____/|_|  |_|_|\_\"
echo "         | | "
echo "         |\  "                                               
echo -e "${RED}                  ~ Tools for Hacking by DEVEL 3MK ${NC}"
echo ""
echo "---------------------------------------------------------------------------------------"
echo ""
echo -e "${RED}[!] This Tool Must Run As ROOT [!]${NC}"
echo ""
echo -e "${CYAN}[>] Press ENTER to Install DEVEL 3MK, CTRL+C to Abort.${NC}"
read INPUT
echo ""

# Check root privileges
if [[ $EUID -ne 0 ]]; then
   echo -e "${RED}[!] This script must be run as root.${NC}" 
   exit 1
fi

# Set installation directories
if [ "$PREFIX" = "/data/data/com.termux/files/usr" ]; then
    INSTALL_DIR="$PREFIX/usr/share/doc/hackerpro"
    BIN_DIR="$PREFIX/usr/bin/"
    pkg install -y git python2
else
    INSTALL_DIR="/usr/share/doc/hackerpro"
    BIN_DIR="/usr/bin/"
fi

# Display installation progress
echo "[✔] Checking directories..."
if [ -d "$INSTALL_DIR" ]; then
    echo "[!] Directory hackerpro was found. Do you want to replace it? [y/n]:"
    read answer
    if [ "$answer" = "y" ]; then
        rm -R "$INSTALL_DIR"
    else
        exit
    fi
fi

echo "[✔] Installing..."
echo ""
git clone https://github.com/technicaldada/hackerpro.git "$INSTALL_DIR"
echo "#!/bin/bash\npython $INSTALL_DIR/hackerpro.py" '${1+"$@"}' > hackerpro
chmod +x hackerpro
sudo cp hackerpro /usr/bin/
rm hackerpro

# Finalize installation
if [ -d "$INSTALL_DIR" ] ; then
    echo ""
    echo "[✔] Successfully Installed!!!"
    echo ""
    echo "[✔]========================================================================[✔]"
    echo "[✔] All Is Done!! You can execute the tool by typing DEVEL 3MK !!"
    echo "[✔]========================================================================[✔]"
    echo ""
else
    echo "[✘] Installation Failed!!!"
    exit 1
fi
