import 'package:flutter/material.dart';

import 'package:openeew_provisioner/widgets/space.dart';
import 'package:openeew_provisioner/theme/carbon.dart';

class InfoField extends StatelessWidget {
  final String title;
  final String text;

  const InfoField(this.title, this.text);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        CText(data: this.title, style: TextStyle(fontWeight: FontWeight.bold)),
        Space(10),
        CText(data: this.text),
        Space(10),
      ],
    );
  }
}
