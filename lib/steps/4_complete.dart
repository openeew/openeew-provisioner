import 'package:flutter/material.dart';

import 'package:openeew_provisioner/theme/carbon.dart';

import 'package:openeew_provisioner/widgets/space.dart';

class Complete extends StatelessWidget {
  final Function setStep;
  final Map state;

  Complete(this.setStep, this.state);

  @override
  Widget build(BuildContext context) {
    return CTile(
      content: Column(
        children: <Widget>[
          RichText(
            text: TextSpan(
              style: DefaultTextStyle.of(context).style,
              children: <TextSpan>[
                TextSpan(text: "Thank you for adding your sensor to the OpenEEW network - helping us detect and issue alerts that allow people to get out of harm's way.")
              ]
            )
          ),
          Space(40),
          RichText(
            text: TextSpan(
              style: DefaultTextStyle.of(context).style,
              children: <TextSpan>[
                TextSpan(text: "Login to the OpenEEW dashboard"),
                TextSpan(text: " (using the credentials you just created), and begin to see activity that your sensor detects.")
              ]
            )
          ),
        ]
      )
    );
  }
}
