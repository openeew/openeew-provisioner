import 'package:flutter/material.dart';
import 'package:smartconfig/smartconfig.dart';

import 'package:openeew_provisioner/forms/wifi.dart';

import 'package:openeew_provisioner/templates/step.dart';

class Wifi extends StatelessWidget {
  final Function setStep;
  final Map state;

  Wifi(this.setStep, this.state);

  @override
  Widget build(BuildContext context) {
    return StepTemplate(2, 'Enter your credentials to enable internet on the sensor', <Widget>[
      WifiForm(callback: (state) {
        setStep(StepMarker.contact, state);
      })
    ]);
  }
}
