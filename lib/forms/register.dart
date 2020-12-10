import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:openeew_provisioner/templates/step.dart';

import 'package:openeew_provisioner/widgets/space.dart';
import 'package:openeew_provisioner/widgets/info_field.dart';
import 'package:openeew_provisioner/widgets/next_button.dart';

import 'package:openeew_provisioner/operations/perform_device_registration_request.dart';

class RegisterForm extends StatefulWidget {
  final Function callback;
  final Map state;

  RegisterForm({ Key key, this.state, this.callback }) : super(key: key);

  @override
  RegisterFormState createState() {
    return RegisterFormState(state);
  }
}

class RegisterFormState extends State<RegisterForm> {
  bool _sendEmail = true;
  bool _loading = false;
  final Map state;

  RegisterFormState(this.state);

  void submit(BuildContext context) async {
    setState(() { _loading = true; });
    int result = await PerformDeviceRegistrationRequest({ 'state': this.state }).perform();
    setState(() { _loading = false; });

    if (result == 200) {
      if (_sendEmail) {
        // TODO: send email to user
      }

      widget.callback();
    } else {
      // TODO: handle exception
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Space(10),
      Divider(),
      Space(10),
      Text(
        'Device summary',
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
      Divider(),
      Space(10),
      Text(
        'Network information',
        style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
      ),
      Space(20),
      Row(children: <Widget>[
        Expanded(flex: 1, child: InfoField('Network manager', state['email'])),
      ]),
      Space(10),
      Divider(),
      Space(10),
      Row(children: <Widget>[
        Expanded(flex: 4, child: ToggleButtons(
          onPressed: (int index) => setState(() { _sendEmail = !_sendEmail; }),
          isSelected: [!_sendEmail, _sendEmail],
          borderRadius: BorderRadius.circular(30),
          borderWidth: 0.0,
          children: <Widget>[
            Container(),
            Icon(Icons.check_rounded)
          ],
        )),
        Expanded(flex: 8, child: Text('Send me a confirmation email')),
      ]),
      Space(20),
      Divider(),
      Space(20),
      NextButton(onClick: submit, text: 'Register', loading: this._loading),
      Space(20),
    ]);
  }
}
