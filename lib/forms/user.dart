import 'package:flutter/material.dart';
import 'package:openeew_provisioner/theme/carbon.dart';

import 'package:openeew_provisioner/operations/perform_user_registration_request.dart';

import 'package:openeew_provisioner/widgets/space.dart';
import 'package:openeew_provisioner/widgets/horizontal_space.dart';
import 'package:openeew_provisioner/widgets/next_button.dart';

class UserForm extends StatefulWidget {
  final Function callback;

  UserForm({ Key key, this.callback }) : super(key: key);

  @override
  UserFormState createState() {
    return UserFormState();
  }
}

class UserFormState extends State<UserForm> {
  final _formKey = GlobalKey<CFormState>();

  bool _loading = false;
  bool _error = false;
  bool _newUser = true;
  String _firstName = '';
  String _lastName = '';
  String _email = '';
  String _password = '';

  void submit(BuildContext context) async {
    if (_formKey.currentState.validate()) {
      setState(() {
        _loading = true;
        _error = false;
      });

      int result = await PerformUserRegistrationRequest({
        'first_name': _firstName,
        'last_name': _lastName,
        'email': _email,
        'password': _password,
      }).perform();

      setState(() {
        _loading = false;
        _error = result != 200;
      });

      widget.callback({
        'first_name': _firstName,
        'last_name': _lastName,
        'email': _email,
        'password': _password,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return CForm(
      key: _formKey,
      title: _newUser ? 'Create an account' : 'Sign in',
      content: Column(
        children: <Widget>[
          _newUser ? (
            Row(children: <Widget>[
              Expanded(flex: 8, child: CTextField(
                id: 'firstName',
                validator: (value) => _formKey.currentState.validatePresence(value, 'First name is required'),
                label: 'First name',
                hint: 'Beth',
                onChanged: (value) => setState(() { _firstName = value; }),
              )),
              Expanded(flex: 1, child: Container()),
              Expanded(flex: 8, child: CTextField(
                id: 'lastName',
                validator: (value) => _formKey.currentState.validatePresence(value, 'Last name is required'),
                label: 'Last name',
                hint: 'Harmon',
                onChanged: (value) => setState(() { _lastName = value; }),
              )),
            ])
          ) : CText(data: ''),
          Space(20),
          CTextField(
            id: 'email',
            validator: (value) => _formKey.currentState.validatePresence(value, 'Contact email is required'),
            label: 'Contact email',
            hint: 'you@example.com',
            onChanged: (value) => setState(() { _email = value; }),
          ),
          Space(20),
          CTextField(
            id: 'password',
            validator: (value) => _formKey.currentState.validatePresence(value, 'Password is required'),
            label: 'Password',
            onChanged: (value) => setState(() { _password = value; }),
            obscureText: true,
          ),
          Space(20),
          NextButton(onClick: submit, text: 'Submit', loading: this._loading),
          Space(20),
          Row(children: <Widget>[
            CText(data: _newUser ? 'Already have an account?' : 'First time here?'),
            HorizontalSpace(10),
            CLink(
              url: _newUser ? 'Sign in' : 'Create an account',
              onTap: (event) => { setState(() { _newUser = !_newUser; }) }
            )
          ])
        ],
      ),
    );
  }
}
