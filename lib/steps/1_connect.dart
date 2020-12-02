import 'package:flutter/material.dart';

import 'package:openeew_provisioner/templates/step.dart';

import 'package:openeew_provisioner/widgets/space.dart';
import 'package:openeew_provisioner/widgets/next_button.dart';

class Connect extends StatelessWidget {
  final Function setStep;
  final Map state;

  Connect(this.setStep, this.state);

  @override
  Widget build(BuildContext context) {
    return StepTemplate(1, 'Connect your sensor to the internet', <Widget>[
      Space(20),
      NextButton(
        onClick: (context) => setStep(StepMarker.wifi, {}),
        text: "Connect via Wifi",
      ),
      Space(10),
      Text(
        "(We'll ask for access to your location in order to detect your Wifi connection)",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 14.0, fontStyle: FontStyle.italic),
      ),
    ]);
  }
}
