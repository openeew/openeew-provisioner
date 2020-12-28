import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:openeew_provisioner/theme/carbon.dart';

import 'package:openeew_provisioner/widgets/space.dart';
import 'package:openeew_provisioner/widgets/next_button.dart';
import 'package:openeew_provisioner/widgets/error_message.dart';

import 'package:openeew_provisioner/operations/perform_permission_request.dart';
import 'package:openeew_provisioner/operations/perform_position_request.dart';
import 'package:openeew_provisioner/operations/perform_smartconfig_request.dart';
import 'package:openeew_provisioner/operations/perform_wifi_request.dart';

class SensorForm extends StatefulWidget {
  final Function callback;

  SensorForm({ Key key, this.callback }) : super(key: key);

  @override
  SensorFormState createState() {
    return SensorFormState();
  }
}

class SensorFormState extends State<SensorForm> {
  final _formKey = GlobalKey<CFormState>();
  bool _loading = false;
  bool _error = false;
  String _ssid;
  String _bssid;
  String _password;
  String _latitude;
  String _longitude;
  String _city;
  String _country;
  String _mac;

  void submit(BuildContext context) async {
    if (_formKey.currentState.validate()) {
      setState(() {
        _loading = true;
        _error = false;
      });

      String _macaddress = await PerformSmartconfigRequest({
        'ssid': _ssid,
        'bssid': _bssid,
        'password': _password,
      }).perform();

      setState(() {
        _loading = false;
        _error = _macaddress == null || _macaddress == "";
      });

      if (!_error) {
        widget.callback({
          'macaddress': _macaddress,
          'latitude': _latitude,
          'longitude': _longitude,
          'city': _city,
          'country': _country,
        });
      }
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
    return Column(
      children: <Widget>[
        CForm(
          key: _formKey,
          title: 'Connect your sensor to WiFi',
          content: Column(
            children: <Widget>[
              ErrorMessage(this._error, "Sorry, your sensor was unable to connect to the WiFi. Please check it is on and ready, and try again."),
              CTextField(
                validator: (value) => _formKey.currentState.validatePresence(value, 'Please connect to a WiFi network'),
                readOnly: true,
                controller: TextEditingController(text: _ssid),
                prefixIcon: Icon(Icons.wifi_outlined),
                hint: 'Your WiFi network',
                label: 'SSID',
              ),
              Space(20),
              CTextField(
                validator: (value) => _formKey.currentState.validatePresence(value, 'WiFi password is required'),
                obscureText: true,
                prefixIcon: Icon(Icons.lock_outlined),
                hint: 'Your WiFi password',
                label: 'Password',
                description: "We won't store or send this information anywhere",
                onChanged: (value) => setState(() { _password = value; }),
              ),
              Space(20),
            ],
          ),
          actions: NextButton(onClick: submit, text: 'Share credentials', loading: this._loading)
        ),
        Space(40),
        RichText(
          text: TextSpan(
            style: DefaultTextStyle.of(context).style,
            children: <TextSpan>[
              TextSpan(text: "Note: After the initial step, you can provision devices via ethernet if you prefer.")
            ]
          )
        ),
      ]
    );
  }
}
