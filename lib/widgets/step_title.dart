import 'package:flutter/material.dart';

import 'package:openeew_provisioner/widgets/space.dart';

class StepTitle extends StatelessWidget {
  final int step;
  final String text;

  const StepTitle(this.step, this.text);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(
          'Step ' + this.step.toString(),
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold
          ),
        ),
        Space(10),
        Text(this.text),
        Space(10),
      ],
    );
  }
}
