import 'package:flutter/material.dart';

import 'package:openeew_provisioner/forms/contact.dart';

import 'package:openeew_provisioner/templates/step.dart';

class Contact extends StatelessWidget {
  final Function setStep;
  final Map state;

  Contact(this.setStep, this.state);

  @override
  Widget build(BuildContext context) {
    return StepTemplate(3, "What's the best way for OpenEEW to contact you about this device?", <Widget>[
      ContactForm(callback: (state) => setStep(StepMarker.register, state))
    ]);
  }
}
