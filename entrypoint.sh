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


case "$1" in
    bash )
        bash
    ;;

    run_basic )
            
        if [ ! -f "./fb/firebase.json" ]; then
            cp override.json ./fb/firebase.json || true
        fi
        cd fb
        firebase emulators:start --only firestore,database
    ;;

    run_all ) 
        cd fb
        firebase emulators:start --token $FIREBASE_TOKEN --project ${FIREBASE_PROJECT}
    ;;

    setup_all )
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