import 'package:flutter/material.dart';

import 'package:openeew_provisioner/screens/3_contact.dart';

import 'package:openeew_provisioner/templates/step.dart';

import 'package:openeew_provisioner/widgets/next_button.dart';

class Wifi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StepTemplate(2, 'Enter your credentials to enable internet on the sensor', <Widget>[
        NextButton(Contact(), 'Submit')
      ])
    );
  }
}
