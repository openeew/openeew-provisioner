import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:openeew_provisioner/theme/carbon.dart';

import 'package:openeew_provisioner/widgets/space.dart';
import 'package:openeew_provisioner/widgets/info_field.dart';
import 'package:openeew_provisioner/widgets/next_button.dart';
import 'package:openeew_provisioner/widgets/error_message.dart';

import 'package:openeew_provisioner/operations/perform_provision_request.dart';

class ProvisionForm extends StatefulWidget {
  final Function callback;
  final Map state;

  ProvisionForm({ Key key, this.state, this.callback }) : super(key: key);

  @override
  ProvisionFormState createState() {
    return ProvisionFormState(state);
  }
}

class ProvisionFormState extends State<ProvisionForm> {
  bool _sendEmail = true;
  bool _loading = false;
  bool _error = false;
  final Map state;

  ProvisionFormState(this.state);

  void submit(BuildContext context) async {
    setState(() {
      _loading = true;
      _error = false;
    });

    int result = await PerformProvisionRequest({ 'state': this.state }).perform();

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
      Space(20),
      CForm(
        content: Column(
          children: <Widget>[
            RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: <TextSpan>[
                  TextSpan(text: 'Alright! Your sensor is connected to the internet and should show a '),
                  TextSpan(text: 'green light', style: TextStyle(color: CColors.green60)),
                  TextSpan(text: '. Now, review the following information and add your sensor to the OpenEEW network.'),
                ]
              )
            ),
            Space(20),
            Row(children: <Widget>[
              Expanded(flex: 1, child: InfoField('Sensor ID', state['macaddress'])),
              Expanded(flex: 1, child: InfoField('Coordinates', state['latitude'] + ',' + state['longitude'])),
            ]),
            Space(10),
            Row(children: <Widget>[
              Expanded(flex: 1, child: InfoField('Device owner', state['givenName'] + ' ' + state['familyName'])),
              Expanded(flex: 1, child: InfoField('Device owner email', state['email'])),
            ]),
            Row(children: <Widget>[
              Expanded(flex: 1, child: InfoField('Country', state['country'])),
            ]),
            Space(10),
            Space(20),
            ErrorMessage(this._error, "Sorry, we weren't able to provision this device. Please ensure your WiFi is connected and try again."),
          ]
        ),
        actions: NextButton(onClick: submit, text: 'Add my sensor to the network', loading: this._loading, width: 300),
      ),
      Space(40),
      RichText(
        text: TextSpan(
          style: DefaultTextStyle.of(context).style,
          children: <TextSpan>[
            TextSpan(text: "Note: We'll list your device on the dashboard, but to maintain your privacy, we'll only show it's general location (ie, within ~5km of the nearest town). Your name and email will not be visible publicly.")
          ]
        )
      ),
    ]);
  }
}
