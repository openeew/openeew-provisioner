import 'package:flutter/material.dart';

import 'package:openeew_provisioner/screens/steps.dart';

import 'package:openeew_provisioner/forms/complete.dart';

class Complete extends StatelessWidget {
  final Function setStep;
  final Map state;

  Complete(this.setStep, this.state);

  @override
  Widget build(BuildContext context) {
    return CompleteForm();
  }
}
