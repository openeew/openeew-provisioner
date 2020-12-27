import 'package:flutter/material.dart';
import 'package:openeew_provisioner/screens/start.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:openeew_provisioner/theme/carbon.dart';
import 'package:stylex/stylex.dart';

void main() async {
  await DotEnv().load('.env');
  runApp(OpenEEWProvisioner());
}

class OpenEEWProvisioner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StyleStore(
      style: CarbonThemes.gray100,
      child: MaterialApp(
        theme: CarbonThemes.gray100.get<ThemeData>('material-theme'),
        title: 'OpenEEW Provisioner',
        home: Start()
      )
    );
  }
}
