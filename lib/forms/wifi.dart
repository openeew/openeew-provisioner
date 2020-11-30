import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wifi_info_flutter/wifi_info_flutter.dart';

import 'package:openeew_provisioner/templates/step.dart';

import 'package:openeew_provisioner/widgets/space.dart';
import 'package:openeew_provisioner/widgets/next_button.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

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

  void submit(BuildContext context) {
    if (formKey.currentState.validate()) {
      // TODO: turn on smartconfig to fetch mac address
      // var config = await Smartconfig.start(_ssid, _bssid, _password);
      _mac = "te:st:ma:ca:dd:re:ss";

      widget.callback({
        'mac': _mac,
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
    try {
      String ssid = await WifiInfo().getWifiName();
      String bssid = await WifiInfo().getWifiBSSID();

      if (mounted) {
        setState(() {
          _ssid = ssid;
          _bssid = bssid;
        });
      }
    } on PlatformException {}
  }

  Future<void> initLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      List<Placemark> placemarks = await placemarkFromCoordinates(position.longitude, position.latitude);

      if (mounted) {
        setState(() {
          _latitude = position.latitude.toString();
          _longitude = position.longitude.toString();
          _city = placemarks[0].locality.toString();
          _country = placemarks[0].country.toString();
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
