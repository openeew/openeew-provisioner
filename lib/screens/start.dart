import 'package:flutter/material.dart';
import 'package:openeew_provisioner/screens/steps.dart';
import 'package:openeew_provisioner/widgets/logo.dart';
import 'package:openeew_provisioner/widgets/next_button.dart';
import 'package:openeew_provisioner/widgets/space.dart';

import 'package:openeew_provisioner/theme/carbon.dart';

class Start extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Container(
              constraints: BoxConstraints(maxWidth: 300),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                ],
              ),
            ),
          ),
          NextButton(route: Steps(), text: 'Get started')
        ],
      ),
    );
  }
}
