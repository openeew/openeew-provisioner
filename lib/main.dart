import 'package:flutter/material.dart';
import 'package:openeew_provisioner/screens/start.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await DotEnv().load('.env');
  runApp(OpenEEWProvisioner());
}

class OpenEEWProvisioner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OpenEEW Provisioner',
      theme: ThemeData(primarySwatch: Colors.pink),
      home: Start()
    );
  }
}
