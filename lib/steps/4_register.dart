import 'package:flutter/material.dart';

import 'package:openeew_provisioner/templates/step.dart';

import 'package:openeew_provisioner/widgets/next_button.dart';

class Register extends StatelessWidget {
  final Function setStep;

  Register(this.setStep);

  @override
  Widget build(BuildContext context) {
    return StepTemplate(4, "Register your device on the OpenEEW network", <Widget>[
      NextButton(
        onClick: (context) => setStep(StepMarker.complete),
        text: 'Register',
      )
    ]);
  }
}
