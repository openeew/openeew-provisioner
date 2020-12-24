import 'package:flutter/material.dart';

import 'package:openeew_provisioner/forms/user.dart';

import 'package:openeew_provisioner/templates/step.dart';

class User extends StatelessWidget {
  final Function setStep;
  final Map state;

  User(this.setStep, this.state);

  @override
  Widget build(BuildContext context) {
    return StepTemplate(<Widget>[
      UserForm(callback: (state) => setStep(StepMarker.wifi, state))
    ]);
  }
}
