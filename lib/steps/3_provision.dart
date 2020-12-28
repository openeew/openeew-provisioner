import 'package:flutter/material.dart';

import 'package:openeew_provisioner/screens/steps.dart';

import 'package:openeew_provisioner/forms/provision.dart';

class Provision extends StatelessWidget {
  final Function setStep;
  final Map state;

  Provision(this.setStep, this.state);

  @override
  Widget build(BuildContext context) {
    return ProvisionForm(state: this.state, callback: () => setStep(StepMarker.complete, {}));
  }
}
