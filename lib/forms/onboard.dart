import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:openeew_provisioner/theme/carbon.dart';

import 'package:openeew_provisioner/widgets/space.dart';
import 'package:openeew_provisioner/widgets/info_field.dart';
import 'package:openeew_provisioner/widgets/next_button.dart';
import 'package:openeew_provisioner/widgets/error_message.dart';

import 'package:openeew_provisioner/operations/perform_onboard_request.dart';

class OnboardForm extends StatefulWidget {
  final Function callback;
  final Map state;

  OnboardForm({ Key key, this.state, this.callback }) : super(key: key);

  @override
  OnboardFormState createState() {
    return OnboardFormState(state);
  }
}

class OnboardFormState extends State<OnboardForm> {
  bool _sendEmail = true;
  bool _loading = false;
  bool _error = false;
  final Map state;

  OnboardFormState(this.state);

  void submit(BuildContext context) async {
    setState(() {
      _loading = true;
      _error = false;
    });

    int result = await PerformOnboardRequest({ 'state': this.state }).perform();

    setState(() {
      _loading = false;
      _error = result != 200;
    });

    if (!_error) {
      widget.callback();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      RichText(
        text: TextSpan(
          style: DefaultTextStyle.of(context).style,
          children: <TextSpan>[
            TextSpan(text: 'Success! Your sensor should now display a '),
            TextSpan(text: 'green light', style: TextStyle(color: CColors.green60)),
            TextSpan(text: '. One last step - review the following information and onboard your sensor.'),
          ]
        )
      ),
      Space(20),
      CForm(
        content: Column(
          children: <Widget>[
            CText(
              data: 'Device summary',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            Space(20),
            Row(children: <Widget>[
              Expanded(flex: 1, child: InfoField('MAC address', state['macaddress'])),
              Expanded(flex: 1, child: InfoField('Coordinates', state['latitude'] + ',' + state['longitude'])),
            ]),
            Space(10),
            Row(children: <Widget>[
              Expanded(flex: 1, child: InfoField('City', state['city'])),
              Expanded(flex: 1, child: InfoField('Country', state['country'])),
            ]),
            Space(10),
            Row(children: <Widget>[
              Expanded(flex: 1, child: InfoField('Device owner', state['first_name'] + ' ' + state['last_name'])),
              Expanded(flex: 1, child: InfoField('Contact email', state['email'])),
            ]),
            Space(20),
            Divider(),
            Space(20),
            CText(
              data: 'Network information',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            Space(20),
            Row(children: <Widget>[
              Expanded(flex: 1, child: InfoField('Network manager', state['email'])),
            ]),
            Space(20),
            Divider(),
            Space(20),
            ErrorMessage(this._error, "Sorry, we weren't able to onboard this device. Please ensure your WiFi is connected and try again."),
          ]
        ),
        actions: NextButton(onClick: submit, text: 'Onboard my sensor', loading: this._loading),
      ),
      Space(40),
      RichText(
        text: TextSpan(
          style: DefaultTextStyle.of(context).style,
          children: <TextSpan>[
            TextSpan(text: "Note: We'll list your device on the dashboard, but to maintain your privacy, we'll only show it's general location (ie, within ~5km of the nearest town). Your name and email will not be publically visible.")
          ]
        )
      ),
    ]);
  }
}
