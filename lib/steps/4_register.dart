import 'package:flutter/material.dart';

import 'package:openeew_provisioner/screens/steps.dart';

import 'package:openeew_provisioner/forms/register.dart';

class Register extends StatelessWidget {
  final Function setStep;
  final Map state;

  Register(this.setStep, this.state);

  @override
  Widget build(BuildContext context) {
    return RegisterForm(state: this.state, callback: () => setStep(StepMarker.complete, {}));
  }
}
