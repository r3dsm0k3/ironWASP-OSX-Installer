#!/bin/bash
# init
function pause(){
   read -p "$*"
}
echo "======================================================================================"
echo "| _____  _______      ___   ____  _____  ____      ____  _       ______   _______    |"
echo "| |_   _||_   __ \   .'   \`.|_   \|_   _||_  _|    |_  _|/ \    .' ____ \ |_   __ \ | "
echo "|   | |    | |__) | /  .-.  \ |   \ | |    \ \  /\  / / / _ \   | (___ \_|  | |__) | |"
echo "|   | |    |  __ /  | |   | | | |\ \| |     \ \/  \/ / / ___ \   _.____\`.   |  ___/ | "
echo "|  _| |_  _| |  \ \_\  \`-'  /_| |_\   |_     \  /\  /_/ /   \ \_| \____) | _| |_    | "
echo "| |_____||____| |___|\`.___.'|_____|\____|     \/  \/|____| |____|\______.'|_____|   | "
echo "|                                                                                    |"
echo "======================================================================================"
echo "                               IRONWASP Mac OSX Installer                               "
echo "Will automatically install and configure IRONWASP and its dependecies."
echo "All you need to click is next next next."
echo -e "Press+C to cancel the installation at any point.	\n"
pause 'Press [RETURN] key to continue...'
echo -e "\n\n				Installing wine from macports..	\n"
sudo port install wine
echo -e "\n\n				Installing winetricks from macports.	\n"
sudo port install winetricks
echo -e "\n\n				Installing .net2 bottle from winetricks.	\n"
winetricks dotnet20
echo -e "\n\n				Creating the directories.	\n"
PTH="${HOME}/IRONWASP"
iPTH=$PTH"/installer"
mkdir $PTH
mkdir $iPTH
echo -e "\n\n				Starting Wine configurations. \n"
mkdir -p ${HOME}/.cache/winetricks/dotnet20
mkdir -p ${HOME}/.cache/winetricks/dotnet20sp2/
wget "http://software-files-a.cnet.com/s/software/10/72/60/27/dotnetfx.exe" -O ${HOME}"/.cache/winetricks/dotnet20/dotnetfx.exe"
winetricks dotnet20sp2 fontfix
wget http://ironwasp.org/ironwasp.zip -O $iPTH/ironwasp.zip
unzip $iPTH/ironwasp.zip -d $PTH/drive_c/
echo alias ironwasp=\'WINEPREFIX=${HOME}/IRONWASP wine "c:/IronWASP/IronWASP.exe"\' >> ~/.bash_profile
source ~/.bash_profile
echo -e "\n\n				Looks like everything is done,you can start ironWASP by typing ironwasp on the terminal.	\n"

