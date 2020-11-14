import 'package:flutter/material.dart';

import 'package:openeew_provisioner/forms/wifi.dart';

import 'package:openeew_provisioner/templates/step.dart';

class Wifi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StepTemplate(2, 'Enter your credentials to enable internet on the sensor', <Widget>[
        WifiForm()
      ])
    );
  }
}
