import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:openeew_provisioner/templates/step.dart';

import 'package:openeew_provisioner/widgets/space.dart';
import 'package:openeew_provisioner/widgets/next_button.dart';

import 'package:openeew_provisioner/operations/perform_permission_request.dart';
import 'package:openeew_provisioner/operations/perform_position_request.dart';
import 'package:openeew_provisioner/operations/perform_smartconfig_request.dart';
import 'package:openeew_provisioner/operations/perform_wifi_request.dart';

class WifiForm extends StatefulWidget {
  final Function callback;

  WifiForm({ Key key, this.callback }) : super(key: key);

  @override
  WifiFormState createState() {
    return WifiFormState();
  }
}

class WifiFormState extends State<WifiForm> {
  final formKey = GlobalKey<FormState>();
  String _ssid;
  String _bssid;
  String _password;
  String _latitude;
  String _longitude;
  String _city;
  String _country;
  String _mac;

  void submit(BuildContext context) async {
    if (formKey.currentState.validate()) {
      String _macaddress = await PerformSmartconfigRequest({
        'ssid': _ssid,
        'bssid': _bssid,
        'password': _password,
      }).perform();

      widget.callback({
        'macaddress': _macaddress.replaceAll(':', ''),
        'latitude': _latitude,
        'longitude': _longitude,
        'city': _city,
        'country': _country,
      });
    }
  }

  @override
  void initState() {
    super.initState();

    initLocation();
    initSmartconfig();
  }

  Future<void> initSmartconfig() async {
    if (!await PerformPermissionRequest().perform()) {
      debugPrint("Please grant permissions!");
      return;
    }

    try {
      Map wifi = await PerformWifiRequest().perform();

      if (mounted) {
        setState(() {
          _ssid = wifi['ssid'];
          _bssid = wifi['bssid'];
        });
      }
    } on PlatformException {}
  }

  Future<void> initLocation() async {
    try {
      Map position = await PerformPositionRequest().perform();

      if (mounted) {
        setState(() {
          _latitude = position['latitude'];
          _longitude = position['longitude'];
          _city = position['city'];
          _country = position['country'];
        });
      }
    } on PlatformException {}
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            enabled: false,
            controller: TextEditingController(text: _ssid),
            decoration: InputDecoration(
              icon: Icon(Icons.wifi_outlined),
              hintText: 'Your WiFi network',
              labelText: 'SSID',
            ),
            validator: (value) => (value == null || value.isEmpty) ? 'Please connect to a Wifi network' : null,
          ),
          Space(20),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              icon: Icon(Icons.lock_outlined),
              hintText: 'Your WiFi password',
              labelText: 'Password',
              helperText: "We won't store or send this information anywhere"
            ),
            validator: (value) => (value == null || value.isEmpty) ? 'Wifi password is required' : null,
            onChanged: (value) => setState(() { _password = value; }),
          ),
          Space(20),
          NextButton(onClick: submit, text: 'Submit')
        ],
      ),
    );
  }
}
