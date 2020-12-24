import 'package:flutter/material.dart';

import 'package:openeew_provisioner/templates/step.dart';

import 'package:openeew_provisioner/widgets/space.dart';
import 'package:openeew_provisioner/widgets/next_button.dart';

import 'package:openeew_provisioner/theme/carbon.dart';

class Wifi extends StatelessWidget {
  final Function setStep;
  final Map state;

  Wifi(this.setStep, this.state);

  @override
  Widget build(BuildContext context) {
    return StepTemplate(<Widget>[
      CText(data: 'To begin reporting, your sensor needs to connect to WiFi. Make sure your sensor is on and flashing a blue light.'),
      Space(20),
      CText(data: '(After the initial setup, you can use ethernet if you prefer)'),
      NextButton(
        onClick: (context) => setStep(StepMarker.sensor, {}),
        text: "Connect via WiFi",
      ),
      Space(10),
      Text(
        "(We'll ask for access to your location in order to detect your WiFi connection)",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 14.0, fontStyle: FontStyle.italic),
      ),
    ]);
  }
}
