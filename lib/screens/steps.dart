import 'package:flutter/material.dart';

import 'package:openeew_provisioner/steps/1_connect.dart';
import 'package:openeew_provisioner/steps/2_wifi.dart';
import 'package:openeew_provisioner/steps/2_ethernet.dart';
import 'package:openeew_provisioner/steps/3_contact.dart';
import 'package:openeew_provisioner/steps/4_register.dart';
import 'package:openeew_provisioner/steps/5_complete.dart';

import 'package:openeew_provisioner/templates/step.dart';

import 'package:openeew_provisioner/widgets/step_progress.dart';
import 'package:openeew_provisioner/widgets/space.dart';
import 'package:openeew_provisioner/widgets/logo.dart';

class Steps extends StatefulWidget {
  @override
  StepsState createState() {
    return StepsState();
  }
}

class StepsState extends State<Steps> {
  final int maxSteps = 5;
  var _step = StepMarker.connect;

  void setStep(value) {
    setState(() => { _step = value });
  }

  int getStep() {
    switch(_step) {
      case StepMarker.connect:  return 1;
      case StepMarker.wifi:     return 2;
      case StepMarker.ethernet: return 2;
      case StepMarker.contact:  return 3;
      case StepMarker.register: return 4;
      case StepMarker.complete: return 5;
    }
  }

  Widget getWidget() {
    switch (_step) {
      case StepMarker.connect:  return Connect(setStep);
      case StepMarker.wifi:     return Wifi(setStep);
      case StepMarker.ethernet: return Ethernet(setStep);
      case StepMarker.contact:  return Contact(setStep);
      case StepMarker.register: return Register(setStep);
      case StepMarker.complete: return Complete(setStep);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Column(children: <Widget>[
                StepProgress(getStep() / maxSteps),
                Space(20),
                Logo(0.75, false),
                Space(60),
              ]),
              getWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
