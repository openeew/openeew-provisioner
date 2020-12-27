import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:openeew_provisioner/theme/carbon.dart';

import 'package:openeew_provisioner/widgets/space.dart';
import 'package:openeew_provisioner/widgets/next_button.dart';

import 'package:openeew_provisioner/operations/perform_url_route.dart';

class CompleteForm extends StatefulWidget {
  CompleteForm({ Key key }) : super(key: key);

  @override
  CompleteFormState createState() {
    return CompleteFormState();
  }
}

class CompleteFormState extends State<CompleteForm> {
  void submit(BuildContext context) async {
    await PerformUrlRoute({
      'url': DotEnv().env['DASHBOARD_URL']
    }).perform();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CForm(
          title: 'Success!',
          content: Column(
            children: <Widget>[
              RichText(
                text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    TextSpan(text: "Thank you for adding your sensor to the OpenEEW network - helping us detect and issue alerts that allow people to get out of harm's way. You can now view your device (and others) on the OpenEEW dashboard.")
                  ]
                )
              ),
              Space(40),
            ],
          ),
          actions: NextButton(onClick: submit, text: 'Visit the dashboard')
        ),
        Space(40),
        RichText(
          text: TextSpan(
            style: DefaultTextStyle.of(context).style,
            children: <TextSpan>[
              TextSpan(text: "Note: You can login to the dashboard using the same credentials you created here.")
            ]
          )
        ),
      ]
    );
  }
}
