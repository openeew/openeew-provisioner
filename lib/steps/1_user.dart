import 'package:flutter/material.dart';

import 'package:openeew_provisioner/screens/steps.dart';
import 'package:openeew_provisioner/forms/user.dart';

class User extends StatelessWidget {
  final Function setStep;
  final Map state;

  User(this.setStep, this.state);

  @override
  Widget build(BuildContext context) {
    return UserForm(callback: (state) => setStep(StepMarker.wifi, state));
  }
}
