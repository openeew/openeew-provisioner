import 'package:flutter/material.dart';

import 'package:openeew_provisioner/screens/2_ethernet.dart';
import 'package:openeew_provisioner/screens/2_wifi.dart';

import 'package:openeew_provisioner/templates/step.dart';

import 'package:openeew_provisioner/widgets/space.dart';
import 'package:openeew_provisioner/widgets/next_button.dart';

class Connect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StepTemplate(1, 'Connect your sensor to the internet', <Widget>[
        Space(20),
        NextButton(route: Wifi(), text: "I'll be connecting the device to WiFi"),
        Space(20),
        NextButton(route: Ethernet(), text: "I've connected to an ethernet cable"),
      ]),
    );
  }
}
