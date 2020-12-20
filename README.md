# eutychia_mobile_app

A new Flutter project.

## Getting Started

- Make sure Visual Studio Code is installed
- Install [Flutter](https://flutter.dev/docs/get-started/install) on your machine
- Clone this project
- Clone the [API project](https://github.com/DutchDestroyer/eutychia-api.git)
- Clone the [Open API generator project](https://github.com/OpenAPITools/openapi-generator.git)
- Follow the steps in the open api generator readme file to install the project correctly
- In step 2 of this readme, use the following command `java -jar .\modules\openapi-generator-cli\target\openapi-generator-cli.jar generate -i C:\Users\markw\Documents\eutychia\dev\eutychia-api\yaml-unresolved\swagger.yaml -g dart -o C:\Users\markw\Documents\testDart --global-property modelTests=false` --> IMPORTANT, change to your own paths
- In this project, go to the pubspec.yaml file and change `C:\Users\markw\Documents\testDart` to the path you used in the prevous step
- Run `flutter pub get`  from the debug console
- Now you should be able to run the project (hit F5)


### Windows
Install [Android Studio](https://developer.android.com/studio?gclid=Cj0KCQiAifz-BRDjARIsAEElyGLn5Swm8VGPQ3jd94zhWhdtrndH3Cyml2Xaw6xQejMlVR0eUCCTVlYaArHJEALw_wcB&gclsrc=aw.ds) and create a [Android emulator](https://developer.android.com/studio/run/managing-avds)

### macOS
Follow the steps describe [here](https://grinchik.com/blog/how-to-install-ios-simulator-and-android-emulator-on-mac)

