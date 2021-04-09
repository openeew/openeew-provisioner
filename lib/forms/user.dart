import 'package:flutter/material.dart';
import 'package:openeew_provisioner/theme/carbon.dart';

import 'package:openeew_provisioner/operations/perform_user_request.dart';

import 'package:openeew_provisioner/widgets/space.dart';
import 'package:openeew_provisioner/widgets/horizontal_space.dart';
import 'package:openeew_provisioner/widgets/next_button.dart';
import 'package:openeew_provisioner/widgets/error_message.dart';

class UserForm extends StatefulWidget {
  final Function callback;

  UserForm({ Key key, this.callback }) : super(key: key);

  @override
  UserFormState createState() {
    return UserFormState();
  }
}

class UserFormState extends State<UserForm> {
  GlobalKey<CFormState> _formKey = GlobalKey<CFormState>();

  bool _loading = false;
  bool _error = false;
  String _givenName = '';
  String _familyName = '';
  String _email = '';
  String _password = '';

  void submit(BuildContext context) async {
    if (_formKey.currentState.validate()) {
      setState(() {
        _loading = true;
        _error = false;
      });

      Map result = await PerformUserRequest({
        'givenName': _givenName,
        'familyName': _familyName,
        'email': _email,
      }).perform();

      setState(() {
        _loading = false;
        _error = result['uuid'] == null || result['uuid'].isEmpty;
      });

      if (!_error) {
        widget.callback({
          'givenName': _givenName,
          'familyName': _familyName,
          'email': _email,
          'uuid': result['uuid'],
          'link': result['link'],
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        CForm(
          key: _formKey,
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              CText(
                data: 'Connect your sensor to a USB-C cable. Then, let us know who the sensor belongs to.',
                style: TextStyle(fontSize: 20.0),
                textAlign: TextAlign.left,
              ),
              Space(20),
              ErrorMessage(this._error, "Sorry, we weren't able to create an account for you. Please check your credentials and try again."),
              Column(
                children: <Widget>[
                  Row(children: <Widget>[
                    Expanded(flex: 8, child: CTextField(
                      id: 'givenName',
                      validator: (value) => _formKey.currentState.validatePresence(value, 'First name is required'),
                      label: 'Sensor owner',
                      hint: 'First name',
                      onChanged: (value) => setState(() { _givenName = value; }),
                    )),
                    Expanded(flex: 1, child: Container()),
                    Expanded(flex: 8, child: CTextField(
                      id: 'familyName',
                      label: '',
                      validator: (value) => _formKey.currentState.validatePresence(value, 'Last name is required'),
                      hint: 'Last name',
                      onChanged: (value) => setState(() { _familyName = value; }),
                    )),
                  ]),
                  Space(20),
                ]
              ),
              CTextField(
                id: 'email',
                validator: (value) => _formKey.currentState.validatePresence(value, 'Contact email is required'),
                label: 'Email',
                hint: 'you@example.com',
                onChanged: (value) => setState(() { _email = value; }),
              ),
              Space(20),
            ],
          ),
          actions: NextButton(onClick: submit, text:'Next', loading: this._loading),
        ),
      ]
    );
  }
}
