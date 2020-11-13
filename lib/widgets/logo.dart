import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final double scale;
  final bool showText;

  Logo(this.scale, this.showText);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset('images/logo.png', width: scale * 48, height: scale * 48),
        this.showText ? Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: Text(
            'OpenEEW',
            style: TextStyle(
              fontSize: scale * 24.0,
              fontWeight: FontWeight.bold
            ),
          ),
        ) : Text(''),
      ]
    );
  }
}
