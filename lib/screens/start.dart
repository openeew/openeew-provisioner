import 'package:flutter/material.dart';
import 'package:loading/loading.dart';
import 'package:loading/indicator/line_scale_indicator.dart';

import 'package:openeew_provisioner/operations/perform_route.dart';

import 'package:openeew_provisioner/screens/steps.dart';
import 'package:openeew_provisioner/widgets/logo.dart';
import 'package:openeew_provisioner/widgets/next_button.dart';
import 'package:openeew_provisioner/widgets/space.dart';

import 'package:openeew_provisioner/theme/carbon.dart';

class Start extends StatefulWidget {
  @override
  StartState createState() {
    return StartState();
  }
}

class StartState extends State<Start> {
  void delayNavigate(BuildContext context, int delay) {
    Future.delayed(Duration(milliseconds: delay), () {
      PerformRoute({ 'context': context, 'route': Steps() }).perform();
    });
  }

  @override
  Widget build(BuildContext context) {
    delayNavigate(context, 4000);

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/start.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Logo(1),
                    Space(20),
                    CText(
                      data: 'OpenEEW Sensors',
                      style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                    ),
                    Space(10),
                    CText(
                      data: 'Provision your sensor',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    Space(240),
                    Loading(indicator: LineScaleIndicator(), size: 25.0),
                    Space(120),

                  ]
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
