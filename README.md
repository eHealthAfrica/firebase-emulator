# firebase-emulator
Docker build process for containerized Google Firebase Emulator

`docker pull ehealthafrica/firebase-emulator:latest`

See [emulator documentation](https://firebase.google.com/docs/emulator-suite/install_and_configure) and sample docker-compose.yml for image usage.
To change default behavior, create a `firebase.json` and mount into the volume @ `/app/firebase.json` as shown in the included compose file.
