import 'package:flutter/material.dart';

import 'package:openeew_provisioner/templates/step.dart';

import 'package:openeew_provisioner/widgets/space.dart';
import 'package:openeew_provisioner/widgets/next_button.dart';
import 'package:permission_handler/permission_handler.dart';

class Connect extends StatelessWidget {
  final Function setStep;

  Connect(this.setStep);

  @override
  Widget build(BuildContext context) {
    return StepTemplate(1, 'Connect your sensor to the internet', <Widget>[
      Space(20),
      NextButton(
        onClick: (context) async {
          if (await Permission.location.request().isGranted) {
            setStep(StepMarker.wifi);
          } else {
            debugPrint("Please grant permissions!");
          }
        },
        text: "I'll be connecting the device to WiFi",
      ),
      Space(20),
      NextButton(
        onClick: (context) => setStep(StepMarker.ethernet),
        text: "I've connected to an ethernet cable",
      ),
    ]);
  }
}
