import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';

import 'package:openeew_provisioner/templates/step.dart';

import 'package:openeew_provisioner/widgets/space.dart';
import 'package:openeew_provisioner/widgets/info_field.dart';
import 'package:openeew_provisioner/widgets/next_button.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';

class RegisterForm extends StatefulWidget {
  final Function callback;

  RegisterForm({ Key key, this.callback }) : super(key: key);

  @override
  RegisterFormState createState() {
    return RegisterFormState();
  }
}

class RegisterFormState extends State<RegisterForm> {
  bool _sendEmail = true;

  // TODO: gather this information from previous steps
  final Map data = {
    'mac_address': '120869334',
    'latitude': '17.01',
    'longitude': '-96.2',
    'city': 'Oaxaca',
    'country': 'Mexico',
    'owner': 'Luis Vasquez',
    'email': 'test@test.com',
    'admin': 'admin@test.com',
  };

  void submit(BuildContext context) {
    sendRegistration();

    if(_sendEmail) {
      // TODO: send email to user
    }

    widget.callback();
  }

  Future<void> sendRegistration() async {
    var response = await http.post(DotEnv().env['ENDPOINT_URL'], body: jsonEncode(data));

    if (response.statusCode != 200) {
      throw Exception('Failed to register user.');
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
        Expanded(flex: 1, child: InfoField('MAC address', data['mac_address'])),
        Expanded(flex: 1, child: InfoField('Coordinates', data['latitude'] + ',' + data['longitude'])),
      ]),
      Space(10),
      Row(children: <Widget>[
        Expanded(flex: 1, child: InfoField('City', data['city'])),
        Expanded(flex: 1, child: InfoField('Country', data['country'])),
      ]),
      Space(10),
      Row(children: <Widget>[
        Expanded(flex: 1, child: InfoField('Device owner', data['owner'])),
        Expanded(flex: 1, child: InfoField('Contact email', data['email'])),
      ]),
      Divider(),
      Space(10),
      Text(
        'Network information',
        style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
      ),
      Space(20),
      Row(children: <Widget>[
        Expanded(flex: 1, child: InfoField('Network manager', data['admin'])),
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
      NextButton(onClick: submit, text: 'Register'),
      Space(20),
    ]);
  }
}
