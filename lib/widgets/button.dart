import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:openeew_provisioner/operations/perform_route.dart';

import 'package:openeew_provisioner/widgets/platform_widget.dart';

class Button extends PlatformWidget {
  final String text;
  final Function onClick;

  const Button({ this.text, this.onClick });

  @override
  Widget ios(BuildContext context) {
    return CupertinoButton(
      color: Colors.blue,
      padding: EdgeInsets.all(20.0),
      onPressed: this.onClick,
      child: Text(this.text),
    );
  }

  @override
  Widget fallback(BuildContext context) {
    return FlatButton(
      color: Colors.blue,
      textColor: Colors.white,
      padding: EdgeInsets.all(20.0),
      splashColor: Colors.blueAccent,
      onPressed: this.onClick,
      child: Text(this.text)
    );
  }
}
