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
  int _frequency;

  final int MIN_WIFI_FREQUENCY = 2401;
  final int MAX_WIFI_FREQUENCY = 2495;

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
          _frequency = wifi['frequency'];
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
              CText(
                data: "We'll use the WiFi network that your phone is connected to.",
                style: TextStyle(fontSize: 16.0),
                textAlign: TextAlign.left,
              ),
              Space(20),
              CTextField(
                validator: (value) => _formKey.currentState.validatePresence(value, 'Please connect to a WiFi network'),
                readOnly: true,
                controller: TextEditingController(text: _ssid),
                prefixIcon: Icon(Icons.wifi_outlined),
                hint: 'Your WiFi network',
                label: 'SSID',
              ),
              Space(5),
              _frequency != null &&
                      (_frequency < MIN_WIFI_FREQUENCY ||
                          _frequency > MAX_WIFI_FREQUENCY)
                  ? Padding(
                    padding: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.1),
                    child: CText(
                        data:
                            "Please, make sure you are using a 2.4GHz wifi network if available.",
                        textAlign: TextAlign.start,
                        style: TextStyle(color: CColors.red40, fontSize: 16.0),
                      ),
                  )
                  : Container(),
              Space(20),
              CTextField(
                validator: (value) => _formKey.currentState.validatePresence(value, 'WiFi password is required'),
                obscureText: true,
                prefixIcon: Icon(Icons.lock_outlined),
                hint: 'WiFi password',
                label: 'Password',
                description: "(After the initial setup, you can connect your device via Ethernet or WiFi if you prefer)",
                onChanged: (value) => setState(() { _password = value; }),
              ),
              Space(20)
            ],
          ),
          actions: NextButton(onClick: submit, text: 'Connect sensor to WiFi', loading: this._loading, width: 225),
          note: RichText(
            text: TextSpan(
              style: TextStyle(color: CColors.gray70),
              children: <TextSpan>[
                TextSpan(text: "We don't store your WiFi credentials. Upon entering your password here, we share it only with your sensor and only this one time to connect the sensor to the internet.")
              ]
            )
          )
        ),
      ]
    );
  }
}
