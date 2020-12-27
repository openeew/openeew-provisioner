import 'package:flutter/material.dart';

import 'package:openeew_provisioner/widgets/space.dart';

class ErrorMessage extends StatelessWidget {
  final bool visible;
  final String text;

  const ErrorMessage(this.visible, this.text);

  @override
  Widget build(BuildContext context) {
    if (this.visible) {
      return Text(
        this.text,
        style: TextStyle(color: Colors.red),
        textAlign: TextAlign.center
      );
    } else {
      return Text('');
    }
  }
}
