#Colors

YELLOW='\033[1;33m'
NC='\033[0m' 
GREEN='\033[0;32m'
RED='\033[0;31m'
CYAN='\033[0;36m'
LRED='\033[1;31m'

echo -e "${YELLOW}This script will install a desktop environtment and rdp to access it remotely${NC}"
echo -e "${YELLOW}Proceed? [Press any key to continue or CTRL+C to cancel${NC}"
read meow

echo -e "${CYAN}Installing dependancies${NC}"
sudo apt-get update
sudo apt-get install ubuntu-gnome-desktop
sudo apt-get install -y xrdp
sudo sed -i 's/allowed_users=console/allowed_users=anybody/' /etc/X11/Xwrapper.config
echo -e "${GREEN}Finished Installing dependancies${NC}"

echo -e "${YELLOW}Importing the configuration file and deleting the original one...${NC}"
sudo rm -f /etc/polkit-1/localauthority.conf.d/02-allow-colord.conf
cd /etc/polkit-1/localauthority.conf.d/
sudo wget https://github.com/JmantZZ/remote-desktop-connection-script-ubuntu-20.04/raw/main/02-allow-colord.conf
echo -e "${CYAN}Import has been completed.${NC}"
echo -e "${LRED}Make sure that iptables have been properly configured and the port 3389 is open.${NC}"
echo -e "${LRED}Have fun.${NC}"
sleep 5
