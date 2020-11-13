import 'package:flutter/material.dart';

import 'package:openeew_provisioner/screens/4_register.dart';

import 'package:openeew_provisioner/templates/step.dart';

import 'package:openeew_provisioner/widgets/next_button.dart';

class Contact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StepTemplate(3, "What's the best way for OpenEEW to contact you about this device?", <Widget>[
        NextButton(Register(), 'Submit')
      ])
    );
  }
}
