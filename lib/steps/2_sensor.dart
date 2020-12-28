import 'package:flutter/material.dart';

import 'package:openeew_provisioner/screens/steps.dart';

import 'package:openeew_provisioner/forms/sensor.dart';

class Sensor extends StatelessWidget {
  final Function setStep;
  final Map state;

  Sensor(this.setStep, this.state);

  @override
  Widget build(BuildContext context) {
    return SensorForm(callback: (state) => setStep(StepMarker.provision, state));
  }
}
