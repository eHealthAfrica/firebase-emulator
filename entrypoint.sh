#!/bin/bash
set -Eeuo pipefail


# Define help message
show_help() {
    echo """
    Commands
    ----------------------------------------------------------------------------
    bash          : run bash
    emulators     : start standard emulators
    all           : start all emulators ( requires FIREBASE_TOKEN)
    """
}

check_credentials() {
    if [[ -z "${FIREBASE_PROJECT}" ]]; then
        echo "FIREBASE_PROJECT must be set. See Readme."
        return 1      
    fi
    if [[ -z "${FIREBASE_TOKEN}" ]]; then
        echo "FIREBASE_TOKEN must be set. See Readme."
        return 1      
    fi
}

case "$1" in
    bash )
        bash
    ;;

    run_basic )
        if [ ! -f "./fb/firebase.json" ]; then
            cp override.json ./fb/firebase.json || true
        fi
        if [ ! -f "./fb/.firebaserc" ]; then
            echo "{\"projects\": {\"default\": \"local-development\"}}" | tee ./fb/.firebaserc
        fi
        cd fb
        firebase emulators:start --only firestore,database
    ;;

    run_all )
        check_credentials
        cd fb
        firebase emulators:start --token $FIREBASE_TOKEN --project ${FIREBASE_PROJECT}
    ;;

    setup_all )
        check_credentials
        cp override.json ./fb/firebase.json || true
        cd fb
        firebase init functions --token $FIREBASE_TOKEN --project ${FIREBASE_PROJECT}
        firebase init hosting --token $FIREBASE_TOKEN --project ${FIREBASE_PROJECT}
    ;;

    help)
        show_help
    ;;

    *)
        show_help
    ;;
esac

echo $1