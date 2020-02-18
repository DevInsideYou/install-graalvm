#!/bin/bash

# remove yourself
rm $0

if [ "$1" == "" ]; then
    JAVA_VERSION="11"
else
    JAVA_VERSION="$1"
fi

if [ "$2" == "" ]; then
    GRAAL_VM_VERSION="20.0.0"
else
    GRAAL_VM_VERSION="$2"
fi

# install curl
sudo apt install -yqqq curl

URL="https://github.com/graalvm/graalvm-ce-builds/releases/download/vm-${GRAAL_VM_VERSION}/graalvm-ce-java${JAVA_VERSION}-linux-amd64-${GRAAL_VM_VERSION}.tar.gz"
TARGET="graalvm-ce-java${JAVA_VERSION}-${GRAAL_VM_VERSION}"
ARCHIVE="${TARGET}.tar.gz"
JVM_LIB_DIRECTORY="/usr/lib/jvm"

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
sudo ln -sfn ${TARGET} ${LINK}

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

echo
ls -l ${JVM_LIB_DIRECTORY} | grep graalvm

echo
echo "You might want to remove older versions from ${JVM_LIB_DIRECTORY}"
