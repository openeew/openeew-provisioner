import 'package:flutter/material.dart';

import 'package:openeew_provisioner/widgets/step_title.dart';
import 'package:openeew_provisioner/widgets/step_progress.dart';
import 'package:openeew_provisioner/widgets/logo.dart';
import 'package:openeew_provisioner/widgets/space.dart';

enum StepMarker { connect, wifi, contact, register, complete }

class StepTemplate extends StatelessWidget {
  final List<Widget> children;
  final String title;
  final int step;

  StepTemplate(this.step, this.title, this.children);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 400),
      child: Column(
        children: <Widget>[StepTitle(this.step, this.title)] + this.children,
      )
    );
  }
}
