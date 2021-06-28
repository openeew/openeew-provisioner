import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:openeew_provisioner/theme/carbon.dart';

import 'package:openeew_provisioner/widgets/space.dart';
import 'package:openeew_provisioner/widgets/next_button.dart';

import 'package:openeew_provisioner/operations/perform_route.dart';
import 'package:openeew_provisioner/operations/perform_url_route.dart';

import 'package:openeew_provisioner/screens/steps.dart';

class CompleteForm extends StatefulWidget {
  final Map state;

  CompleteForm({ Key key, this.state }) : super(key: key);

  @override
  CompleteFormState createState() {
    return CompleteFormState(state);
  }
}

class CompleteFormState extends State<CompleteForm> {
  final Map state;
  final colorGrey = Color.fromARGB(255, 87, 87, 87);

  CompleteFormState(this.state);

  void submit(BuildContext context) async {
    await PerformUrlRoute({ 'link': this.state['link'] }).perform();
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
                  style: TextStyle(fontSize: 20, color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(text: "Thank you for adding your sensor to the OpenEEW network - helping us detect earthquakes and issue alerts that allow people to get out of harm's way.")
                  ]
                )
              ),
              Space(20),
              CText(
                data: 'Next steps',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: colorGrey),
              ),
              Space(20),
              NextButton(onClick: submit, text: 'Visit the OpenEEW dashboard', width: 225),
              Space(20),
              RichText(
                text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    TextSpan(text: "Login to the "),
                    TextSpan(
                      text: "OpenEEW dashboard",
                      style: TextStyle(color: CColors.blue80),
                      recognizer: TapGestureRecognizer()..onTap = () => submit(context)
                    ),
                    TextSpan(
                      text: " and being to see activity that your sensor detects.",
                      style: TextStyle(color: colorGrey)
                    ),
                  ]
                )
              ),
              Space(60),
              CLink(url: 'Add another sensor to the network', onTap: (event) => restart(context)),
            ],
          ),
        ),
      ]
    );
  }
}
