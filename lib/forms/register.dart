import 'package:flutter/material.dart';

import 'package:openeew_provisioner/templates/step.dart';

import 'package:openeew_provisioner/widgets/space.dart';
import 'package:openeew_provisioner/widgets/info_field.dart';
import 'package:openeew_provisioner/widgets/next_button.dart';

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
    'lat_lng': '17.01,-96.2',
    'city': 'Oaxaca',
    'country': 'Mexico',
    'owner': 'Luis Vasquez',
    'email': 'test@test.com',
    'admin': 'admin@test.com',
  };

  void submit(BuildContext context) {
    // TODO: register device
    // TODO: send email to user

    widget.callback();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Text(
        'Device summary',
        style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
      ),
      Space(10),
      Divider(),
      Space(10),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
        Expanded(flex: 1, child: InfoField('MAC address', data['mac_address'])),
        Expanded(flex: 1, child: InfoField('Coordinates', data['lat_lng'])),
      ]),
      Space(10),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
        Expanded(flex: 1, child: InfoField('City', data['city'])),
        Expanded(flex: 1, child: InfoField('Country', data['country'])),
      ]),
      Space(10),
      Row(children: <Widget>[
        Expanded(flex: 1, child: InfoField('Device owner', data['owner'])),
        Expanded(flex: 1, child: InfoField('Contact email', data['email'])),
      ]),
      Divider(),
      Text(
        'Network information',
        style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
      ),
      Space(10),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
        Expanded(flex: 1, child: InfoField('Network manager', data['admin'])),
      ]),
      Space(10),
      Divider(),
      Space(10),
      NextButton(onClick: submit, text: 'Register'),
    ]);
  }
}
