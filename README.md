# OpenEEW Provisioning App

The OpenEEW Provisioning application helps enable an OpenEEW sensor:

- To connect your new OpenEEW sensor to a WiFi network, it will initially power up and poll for SmartConfig details.
- SmartConfig is a provisioning technology developed by TI to connect a new WiFi device to a WiFi network. It uses a mobile app to broadcast the network credentials from a smartphone, or a tablet, to an un-provisioned WiFi device. The advantage of this technology is that the device does not need to directly know SSID or password of an Access Point (AP). This information is provided using this smartphone app. This is particularly important to headless device and systems, due to their lack of a user interface.
- This Android application prompts you for your WiFi SSID and password and sends it to the OpenEEW device via SmartConfig.
- It also asks you to register your new OpenEEW device so you can view earthquake accelerometer data in the cloud.

<table><tr><td>
<p align="center">
<img width="50%" height="50%" src="./images/OpenEEW-Provisioning-Android.gif">
</p>
</tr></table>

## Configuration

This app uses [dotenv](https://pub.dev/packages/flutter_dotenv) in order to manage environment variables

In order to apply environment variables; duplicate the `.env.example` file as `.env`, and overwrite the values in that file.

## Building the App
This provisioning app is built on [Flutter](https://flutter.dev/).

### Local Build
In order to run it locally:

- [Install Flutter](https://flutter.dev/docs/get-started/install) on your local machine

- Get dependencies

  ```sh
  flutter pub get
  ```

- Ensure you have a device connected

  ```sh
  flutter devices
  ```

_(NB this app will run in the web without a device, but due to the nature of the functionality, very little of it will work in the web environment.)_

- Compile and run

  ```sh
  flutter run
  ```
  
### Build for App Store
In order to create a signed app bundle for the play store:

- update `pubspec.yaml`' with the latest version, eg for version 1.0.1 :

```
version: 1.0.1+1
```
- add the path to the signed key in `/android/key.properties`

- run 
````
flutter build appbundle
````

## Contributors

<a href="https://github.com/openeew/openeew-provisioner/graphs/contributors">
  <img src="https://contributors-img.web.app/image?repo=openeew/openeew-provisioner" />
</a>
___

## Contributing and Developer information

The community welcomes your involvement and contributions to this project. Please read the OpenEEW [contributing](https://github.com/openeew/openeew/blob/master/CONTRIBUTING.md) document for details on our code of conduct, and the process for submitting pull requests to the community.

## License

Please review the [Flutter license](https://github.com/flutter/flutter/blob/master/LICENSE)

The OpenEEW sensor is licensed under the Apache Software License, Version 2. Separate third party code objects invoked within this code pattern are licensed by their respective providers pursuant to their own separate licenses. Contributions are subject to the [Developer Certificate of Origin, Version 1.1 (DCO)](https://developercertificate.org/) and the [Apache Software License, Version 2](http://www.apache.org/licenses/LICENSE-2.0.txt).
