import 'package:flutter/material.dart';

import 'package:openeew_provisioner/forms/register.dart';

import 'package:openeew_provisioner/templates/step.dart';

class Register extends StatelessWidget {
  final Function setStep;

  Register(this.setStep);

  @override
  Widget build(BuildContext context) {
    return StepTemplate(4, "Register your device on the OpenEEW network", <Widget>[
      RegisterForm(callback: () => setStep(StepMarker.complete))
    ]);
  }
}
