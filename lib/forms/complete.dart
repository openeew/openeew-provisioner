import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:openeew_provisioner/theme/carbon.dart';

import 'package:openeew_provisioner/widgets/space.dart';
import 'package:openeew_provisioner/widgets/next_button.dart';

import 'package:openeew_provisioner/operations/perform_route.dart';
import 'package:openeew_provisioner/operations/perform_url_route.dart';

import 'package:openeew_provisioner/screens/steps.dart';

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

  void restart(BuildContext context) async {
    PerformRoute({ 'context': context, 'route': Steps() }).perform();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CForm(
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              RichText(
                text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    TextSpan(text: "Thank you for adding your sensor to the OpenEEW network - helping us detect and issue alerts that allow people to get out of harm's way. You can now view your device (and others) on the OpenEEW dashboard.")
                  ]
                )
              ),
              Space(20),
              CText(
                data: 'Next steps',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Space(5),
              RichText(
                text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    TextSpan(text: "Login to the "),
                    TextSpan(text: "OpenEEW dashboard"),
                    TextSpan(text: " and being to see activity that your sensor detects."),
                  ]
                )
              ),
              Space(40),
            ],
          ),
          actions: NextButton(onClick: submit, text: 'Visit the dashboard')
        ),
        Space(20),
        CLink(url: 'Add another sensor to the network', onTap: (event) => restart(context)),
      ]
    );
  }
}
