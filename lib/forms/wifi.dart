import 'package:flutter/material.dart';

import 'package:openeew_provisioner/screens/3_contact.dart';

import 'package:openeew_provisioner/widgets/space.dart';
import 'package:openeew_provisioner/widgets/next_button.dart';

import 'package:openeew_provisioner/operations/perform_route.dart';

class WifiForm extends StatefulWidget {
  @override
  WifiFormState createState() {
    return WifiFormState();
  }
}

class WifiFormState extends State<WifiForm> {
  final _formKey = GlobalKey<FormState>();
  // TODO: fetch available wifi connections
  final ssids = ['Porritt Pirates 5', 'Porritt Pirates'];

  String _ssid = '';
  String _password = '';

  void submit(BuildContext context) {
    // TODO: validate wifi connection

    if (_formKey.currentState.validate()) {
      PerformRoute({ 'context': context, 'route': Contact() }).perform();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          DropdownButtonFormField<String>(
            decoration: InputDecoration(
              icon: Icon(Icons.wifi_outlined),
              hintText: 'Select a network',
              labelText: 'SSID',
            ),
            items: ssids.map((value) => DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            )).toList(),
            validator: (value) => (value == null || value.isEmpty) ? 'Network is required' : null,
            onChanged: (value) => setState(() { _ssid = value; }),
          ),
          Space(20),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              icon: Icon(Icons.lock_outlined),
              hintText: 'Your WiFi password',
              labelText: 'Password',
              helperText: "We won't store or send this information anywhere"
            ),
            validator: (value) => (value == null || value.isEmpty) ? 'Wifi password is required' : null,
            onChanged: (value) => setState(() { _password = value; }),
          ),
          Space(20),
          NextButton(onClick: submit, text: 'Submit')
        ],
      ),
    );
  }
}
