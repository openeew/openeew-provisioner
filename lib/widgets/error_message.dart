import 'package:flutter/material.dart';

import 'package:openeew_provisioner/theme/carbon.dart';
import 'package:openeew_provisioner/widgets/space.dart';

class ErrorMessage extends StatelessWidget {
  final bool visible;
  final String text;

  const ErrorMessage(this.visible, this.text);

  @override
  Widget build(BuildContext context) {
    return this.visible ? Column(
      children: <Widget>[
        Text(
          this.text,
          style: TextStyle(color: CColors.red60)
        ),
        Space(20),
      ]
    ) : Space(0);
  }
}
