# UPB_WEB
use:
    node

dependencies:
    firebase-tools
    flutter_svg

// Aveces es necesario hacer un upgrade 
Ejemplo flutter pub upgrade cloud_firestore
// Aveces es necesario hacer un upgrade 
Ejemplo flutter pub upgrade cloud_firestore
commands:
    flutter pub add firebase_core
    flutter pub add firebase_auth
    flutter pub add cloud_firestore
    flutter pub add firebase_storage
    flutter pub add chewie
    flutter pub add fluro

    |
    |
    |

    flutter pub get
    flutter pub upgrade
    
    #### To run on port 8888
    flutter run -d edge --web-port 8888

    #### To set gsutil with the cors.json file
    gsutil cors set cors.json gs://upbweb-1c67d.appspot.com