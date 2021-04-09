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
                padding: EdgeInsets.all(40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Space(110),
                    Logo(1),
                    Space(25),
                    CText(
                      data: 'OpenEEW Sensors',
                      style: TextStyle(color: CColors.white0, fontSize: 30.0, fontWeight: FontWeight.bold),
                    ),
                    Space(7),
                    CText(
                      data: 'Provision your sensor',
                      style: TextStyle(color: CColors.white0, fontSize: 18.0),
                    ),
                    Space(200),
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
