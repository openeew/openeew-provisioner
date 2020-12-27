import 'package:flutter/material.dart';

import 'package:openeew_provisioner/screens/steps.dart';

import 'package:openeew_provisioner/forms/onboard.dart';

class Onboard extends StatelessWidget {
  final Function setStep;
  final Map state;

  Onboard(this.setStep, this.state);

  @override
  Widget build(BuildContext context) {
    return OnboardForm(state: this.state, callback: () => setStep(StepMarker.complete, {}));
  }
}
