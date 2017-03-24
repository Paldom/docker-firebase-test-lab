#!/bin/bash

cd firebase

if [[ $PROJACC == "" ]]; then
    echo "ERROR: Project Account (PROJACC) is not set!"
    exit 1
fi

if [[ $PROJID == "" ]]; then
    echo "ERROR: Project ID (PROJID) is not set!"
    exit 1
fi

if [[ $CRED == "" ]]; then
    CRED="credentials"
    echo "Using default credentials."
fi

if [[ $TYPE == "" ]]; then
    TYPE="instrumentation"
    echo "Using $TYPE test type."
fi

if [[ $APP == "" ]]; then
    APP="./app/build/outputs/apk/app-debug-unaligned.apk"
    echo "APK location: $APP"
fi

if [[ $TEST == "" ]]; then
    TEST="./app/build/outputs/apk/app-debug-androidTest-unaligned.apk"
    echo "Test APK location: $TEST"
fi

if [[ $DEVICE == "" ]]; then
    DEVICE="Nexus5"
    echo "Testing on $DEVICE device."
fi

if [[ $OS == "" ]]; then
    OS="22"
    echo "Testing on $OS version os."
fi

if [[ $LOCALE == "" ]]; then
    LOCALE="en"
    echo "Testing with $LOCALE locale."
fi

if [[ $ORIENTATION == "" ]]; then
    ORIENTATION="portrait"
    echo "Testing with $ORIENTATION orientation."
fi

# Set project id & account
gcloud config set account ${PROJACC}
gcloud config set project ${PROJID}

# Set credentials
cp ./${CRED} ~/.config/gcloud/credentials

# Run test command
gcloud beta test android run \
      --type ${TYPE} \
      --app ${APP} \
      --test ${TEST} \
      --device-ids ${DEVICE} \
      --os-version-ids ${OS} \
      --locales ${LOCALE} \
      --orientations ${ORIENTATION}

