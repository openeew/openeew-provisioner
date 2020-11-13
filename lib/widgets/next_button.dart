import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:openeew_provisioner/widgets/platform_widget.dart';

class NextButton extends PlatformWidget {
  final Widget route;
  final String text;

  const NextButton(this.route, this.text);

  @override
  Widget ios(BuildContext context) {
    return CupertinoButton(
      color: Colors.blue,
      padding: EdgeInsets.all(20.0),
      onPressed: () {
        Navigator.push(
          context,
          CupertinoPageRoute(builder: (context) => this.route)
        );
      }
    );
  }

  @override
  Widget fallback(BuildContext context) {
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
