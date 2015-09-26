#!/bin/bash

# INSTALL_PATH="."
INSTALL_DIR="/rf24libs"

# ROOT_PATH=${INSTALL_PATH}
ROOT_PATH=${INSTALL_DIR}

DORF24=1
DORF24Network=1
DORF24Mesh=1
DORF24Gateway=1

echo""
echo "RF24 libraries installer by TMRh20"
echo "report issues at https://github.com/TMRh20/RF24/issues"
echo ""
echo "******************** NOTICE **********************"
echo "Installer will create an 'rf24libs' folder for installation of selected libraries"
echo "To prevent mistaken deletion, users must manually delete existing library folders within 'rf24libs' if upgrading"
echo "Run 'sudo rm -r rf24libs' to clear the entire directory"
echo ""
echo ""

echo "Prerequisite: GIT "
echo "Do you want to install GIT using APT?" 
echo -n "(Used to download source code) "
# answer = 'Y'
# echo answer
# case ${answer^^} in
	# Y ) 
# esac
# apt-get install -y git
apt-get install -y build-essential
# echo $'\n'
# echo -n "Do you want to install the RF24 core library, Y/N?"
# echo answer
# case ${answer^^} in
#     Y ) DORF24=1;;
# esac

# echo $'\n'
# echo -n "Do you want to install the RF24Network library?"
# echo answer
# case ${answer^^} in
#     Y ) DORF24Network=1;;
# esac

# echo $'\n'
# echo -n "Do you want to install the RF24Mesh library?"
# echo answer
# case ${answer^^} in
#     Y ) DORF24Mesh=1;;
# esac

# echo $'\n'
# echo -n "Do you want to install the RF24Gateway library?"
# echo answer
# case ${answer^^} in
#     Y ) DORF24Gateway=1;;
# esac

# if [[ $DORF24Gateway > 0 ]]
# then
	echo ""
	echo "Install ncurses library (Recommended for RF24Gateway)"
	# echo answer
    # case ${answer^^} in
		# Y )
apt-get install -y libncurses5-dev
	# esac
	echo ""
# fi

# if [[ $DORF24 > 0 ]]
# then

# mkdir /home/rf24libs
cd ./rf24libs

	echo "make RF24 Repo..."
	echo ""
	# git clone https://github.com/tmrh20/RF24.git RF24
	echo ""
	cd RF24

 make install
	echo ""
# fi

# if [[ $DORF24Network > 0 ]]
# then
	echo "make RF24Network_DEV Repo..."
	echo ""
	cd ..
		# git clone https://github.com/tmrh20/RF24Network.git RF24Network
	echo ""
	cd RF24Network

 make install
	echo ""
# fi

# if [[ $DORF24Mesh > 0 ]]
# then
	echo "Installing RF24Mesh Repo..."
	echo ""
	cd ..
	# git clone https://github.com/tmrh20/RF24Mesh.git RF24Mesh
	echo ""
	cd RF24Mesh
 make install
	echo ""
# fi

# if [[ $DORF24Gateway > 0 ]]
# then
	echo "Installing RF24Gateway Repo..."
	echo ""
	cd ..
	# git clone https://github.com/tmrh20/RF24Gateway.git RF24Gateway
	echo ""
	cd RF24Gateway
 make install
	
    echo ""; echo -n "Do you want to build an RF24Gateway example?"
    # echo answer
    # case ${answer^^} in
       # Y ) 
cd examples/ncurses
	   make -B
	    echo ""
	    echo "Complete, to run the example, cd to rf24libs/RF24Gateway/examples/ncurses and enter  sudo ./RF24Gateway_ncurses"
    # esac	
# fi


echo ""
echo ""
echo "*** Installer Complete ***"
echo "See http://tmrh20.github.io for documentation"
echo "See http://tmrh20.blogspot.com for info "
echo ""
echo "Listing files in install directory:"
# ls ${ROOT_PATH}



