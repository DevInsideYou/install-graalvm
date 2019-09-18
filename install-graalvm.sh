#!/bin/bash

if [ "$1" == "" ]; then
    VERSION="19.2.0.1"
else
    VERSION="$1"
fi


# install curl
sudo apt install -yqqq curl

URL="https://github.com/oracle/graal/releases/download/vm-${VERSION}/graalvm-ce-linux-amd64-${VERSION}.tar.gz"
TARGET="graalvm-ce-19.2.0.1"
ARCHIVE="${TARGET}.tar.gz"
JVM_LIB_DIRECTORY="/usr/lib/jvm"
CURRENT_DIRECTORY=$(pwd)

# chande directory to /usr/lib/jvm
cd ${JVM_LIB_DIRECTORY}

# download the archive
sudo curl -L $URL -o $ARCHIVE

# unpack the archive
sudo tar -zxvf ${ARCHIVE}

# remove the archive
sudo rm ${ARCHIVE}

LINK="graalvm"

# symlink it for simplicity
# we assume here that ${TARGET} directory exists after the extraction
sudo ln -sf ${TARGET} ${LINK}

GRAALVM_DIRECTORY="${JVM_LIB_DIRECTORY}/${LINK}"

# install graalvm as a java alternative
# 1081 is the same priority as the one used by the JVM from the OpenJDK
sudo update-alternatives --install /usr/bin/java java "${GRAALVM_DIRECTORY}/bin/java" 1081

SELECTION_SCREEN_CMD="sudo update-alternatives --config java"

echo
echo "Run '${SELECTION_SCREEN_CMD}' without the single quotes to get back to this selection screen any time."

echo
${SELECTION_SCREEN_CMD}

echo
echo "Run '${SELECTION_SCREEN_CMD}' without the single quotes to get back to this selection screen any time."

echo
echo "Run '${GRAALVM_DIRECTORY}/bin/gu install native-image' without the single quotes to install the native-image utility."

echo
java -version

cd ${CURRENT_DIRECTORY}

# remove yourself
rm $0
