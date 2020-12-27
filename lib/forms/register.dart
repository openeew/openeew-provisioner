import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:openeew_provisioner/widgets/space.dart';
import 'package:openeew_provisioner/widgets/info_field.dart';
import 'package:openeew_provisioner/widgets/next_button.dart';
import 'package:openeew_provisioner/widgets/error_message.dart';

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
  bool _error = false;
  final Map state;

  RegisterFormState(this.state);

  void submit(BuildContext context) async {
    setState(() {
      _loading = true;
      _error = false;
    });

    int result = await PerformDeviceRegistrationRequest({ 'state': this.state }).perform();

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
      Space(20),
      NextButton(onClick: submit, text: 'Register my sensor', loading: this._loading),
      Space(20),
      ErrorMessage(this._error, "Sorry, we weren't able to register your device. Please try again."),
      Space(20)
    ]);
  }
}
