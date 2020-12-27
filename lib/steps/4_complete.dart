import 'package:flutter/material.dart';

class Complete extends StatelessWidget {
  final Function setStep;
  final Map state;

  Complete(this.setStep, this.state);

  @override
  Widget build(BuildContext context) {
    return Text('Thank you!');
  }
}
