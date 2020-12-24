import 'package:flutter/material.dart';

import 'package:openeew_provisioner/forms/sensor.dart';

import 'package:openeew_provisioner/templates/step.dart';

class Sensor extends StatelessWidget {
  final Function setStep;
  final Map state;

  Sensor(this.setStep, this.state);

  @override
  Widget build(BuildContext context) {
    return StepTemplate(<Widget>[
      SensorForm(callback: (state) {
        setStep(StepMarker.register, state);
      })
    ]);
  }
}
