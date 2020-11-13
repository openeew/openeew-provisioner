import 'package:flutter/material.dart';

class NextButton extends StatelessWidget {
  final Widget route;
  final String text;

  const NextButton(this.route, this.text);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      color: Colors.blue,
      textColor: Colors.white,
      padding: EdgeInsets.all(20.0),
      splashColor: Colors.blueAccent,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => this.route)
        );
      },
      child: Text(this.text)
    );
  }
}
