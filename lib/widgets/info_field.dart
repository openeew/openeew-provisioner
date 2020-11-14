import 'package:flutter/material.dart';

import 'package:openeew_provisioner/widgets/space.dart';

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
        Text(
          this.title,
          style: TextStyle(color: Colors.grey[700], fontWeight: FontWeight.bold),
        ),
        Space(10),
        Text(
          this.text,
          style: TextStyle(color: Colors.grey[700])
        ),
        Space(10),
      ],
    );
  }
}
