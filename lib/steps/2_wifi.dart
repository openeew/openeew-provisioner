import 'package:flutter/material.dart';

import 'package:openeew_provisioner/forms/wifi.dart';

import 'package:openeew_provisioner/templates/step.dart';

class Wifi extends StatelessWidget {
  final Function setStep;

  Wifi(this.setStep);

  @override
  Widget build(BuildContext context) {
    return StepTemplate(2, 'Enter your credentials to enable internet on the sensor', <Widget>[
      WifiForm(callback: () => setStep(StepMarker.contact))
    ]);
  }
}
