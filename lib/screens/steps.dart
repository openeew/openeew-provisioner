import 'package:flutter/material.dart';

import 'package:openeew_provisioner/theme/carbon.dart';

import 'package:openeew_provisioner/steps/1_user.dart';
import 'package:openeew_provisioner/steps/2_wifi.dart';
import 'package:openeew_provisioner/steps/3_sensor.dart';
import 'package:openeew_provisioner/steps/4_register.dart';
import 'package:openeew_provisioner/steps/5_complete.dart';

import 'package:openeew_provisioner/widgets/space.dart';
import 'package:openeew_provisioner/widgets/logo.dart';

enum StepMarker { user, wifi, sensor, register, complete }

class Steps extends StatefulWidget {
  @override
  StepsState createState() {
    return StepsState();
  }
}

class StepsState extends State<Steps> {
  final int maxSteps = 5;
  var _step = StepMarker.user;
  Map _state = {};

  void setStep(value, state) {
    _state.addAll(state);
    setState(() {
      _step = value;
      _state = _state;
    });
  }

  Widget getWidget() {
    switch (_step) {
      case StepMarker.user:     return User(setStep, _state);
      case StepMarker.wifi:     return Wifi(setStep, _state);
      case StepMarker.sensor:   return Sensor(setStep, _state);
      case StepMarker.register: return Register(setStep, _state);
      case StepMarker.complete: return Complete(setStep, _state);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            constraints: BoxConstraints(maxWidth: 400),
            child: Column(
              children: <Widget>[
                Row(children: <Widget>[
                  Logo(0.75, false),
                  Space(40),
                  CText(data: 'OpenEEW'),
                  Space(40),
                  CText(data: 'Sensors'),
                ]),
                getWidget(),
              ]
            ),
          ),
        ),
      ),
    );
  }
}
