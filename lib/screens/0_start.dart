import 'package:flutter/material.dart';
import 'package:openeew_provisioner/screens/1_connect.dart';
import 'package:openeew_provisioner/widgets/logo.dart';
import 'package:openeew_provisioner/widgets/next_button.dart';
import 'package:openeew_provisioner/widgets/space.dart';

class Start extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Column(
              children: <Widget>[
                Logo(1, true),
                Space(20),
                Text('Provision your OpenEEW sensor')
              ]
            ),
            NextButton(Connect(), 'Get started'),
          ],
        ),
      ),
    );
  }
}
