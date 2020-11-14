import 'package:flutter/material.dart';

import 'package:openeew_provisioner/widgets/step_title.dart';
import 'package:openeew_provisioner/widgets/step_progress.dart';
import 'package:openeew_provisioner/widgets/logo.dart';
import 'package:openeew_provisioner/widgets/space.dart';

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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Space(20),
          Logo(0.75, false),
          Expanded(
            child: Container(
              constraints: BoxConstraints(minWidth: 150, maxWidth: 400),
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
          ),
        ],
      ),
    );
  }
}
