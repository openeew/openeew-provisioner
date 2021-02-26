import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final double scale;

  Logo(this.scale);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset('images/logo.png', width: scale * 48, height: scale * 48),
      ]
    );
  }
}
