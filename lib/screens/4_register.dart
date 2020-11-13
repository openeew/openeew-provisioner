import 'package:flutter/material.dart';

import 'package:openeew_provisioner/screens/5_complete.dart';

import 'package:openeew_provisioner/templates/step.dart';

import 'package:openeew_provisioner/widgets/next_button.dart';

class Register extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StepTemplate(4, "Register your device on the OpenEEW network", <Widget>[
        NextButton(Complete(), 'Register')
      ])
    );
  }
}
