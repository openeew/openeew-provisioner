import 'package:flutter/material.dart';

import 'package:openeew_provisioner/screens/0_start.dart';
import 'package:openeew_provisioner/screens/2_ethernet.dart';
import 'package:openeew_provisioner/screens/2_wifi.dart';

import 'package:openeew_provisioner/widgets/step_title.dart';
import 'package:openeew_provisioner/widgets/step_progress.dart';
import 'package:openeew_provisioner/widgets/logo.dart';
import 'package:openeew_provisioner/widgets/space.dart';
import 'package:openeew_provisioner/widgets/next_button.dart';

class StepTemplate extends StatelessWidget {
  final List<Widget> children;
  final String title;
  final int step;

  StepTemplate(this.step, this.title, this.children);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Space(20),
          Logo(0.75, false),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                StepProgress(this.step),
                Column(children: <Widget>[StepTitle(this.step, this.title)] + this.children),
                Container(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
