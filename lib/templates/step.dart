import 'package:flutter/material.dart';

import 'package:openeew_provisioner/widgets/step_title.dart';
import 'package:openeew_provisioner/widgets/logo.dart';
import 'package:openeew_provisioner/widgets/space.dart';

enum StepMarker { user, wifi, sensor, register, complete }

class StepTemplate extends StatelessWidget {
  final List<Widget> children;

  StepTemplate(this.children);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 400),
      child: Column(children: this.children),
    );
  }
}
