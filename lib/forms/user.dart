import 'package:flutter/material.dart';
import 'package:openeew_provisioner/theme/carbon.dart';

import 'package:openeew_provisioner/templates/step.dart';

import 'package:openeew_provisioner/widgets/space.dart';
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

  String _firstName = '';
  String _lastName = '';
  String _email = '';

  void submit(BuildContext context) {
    if (_formKey.currentState.validate()) {
      widget.callback({
        'first_name': _firstName,
        'last_name': _lastName,
        'email': _email,
      });
    }
  }

  CValidationResult validatePresence(String value, String message) {
    return value.isEmpty
      ? CValidationResult(type: CValidationResultType.error, message: message)
      : CValidationResult(type: CValidationResultType.success, message: '');
  }

  @override
  Widget build(BuildContext context) {
    return CForm(
      key: _formKey,
      content: Column(
        children: <Widget>[
          Row(children: <Widget>[
            Expanded(flex: 8, child: CTextField(
              id: 'firstName',
              validator: (value) => validatePresence(value, 'First name is required'),
              label: 'First name',
              hint: 'Beth',
              onChanged: (value) => setState(() { _firstName = value; }),
            )),
            Expanded(flex: 1, child: Container()),
            Expanded(flex: 8, child: CTextField(
              id: 'lastName',
              validator: (value) => validatePresence(value, 'Last name is required'),
              label: 'Last name',
              hint: 'Harmon',
              onChanged: (value) => setState(() { _lastName = value; }),
            )),
          ]),
          Space(20),
          CTextField(
            id: 'email',
            validator: (value) => validatePresence(value, 'Contact email is required'),
            label: 'Contact email',
            hint: 'you@example.com',
            onChanged: (value) => setState(() { _email = value; }),
          ),
          Space(20),
          NextButton(onClick: submit, text: 'Submit')
        ],
      ),
    );
  }
}
