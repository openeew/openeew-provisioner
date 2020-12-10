import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:openeew_provisioner/operations/perform_route.dart';

import 'package:openeew_provisioner/widgets/platform_widget.dart';

import 'package:loading/loading.dart';
import 'package:loading/indicator/line_scale_indicator.dart';

class Button extends PlatformWidget {
  final String text;
  final Function onClick;
  final bool loading;

  const Button({ this.text, this.onClick, this.loading });

  @override
  Widget ios(BuildContext context) {
    return CupertinoButton(
      color: Colors.blue,
      padding: EdgeInsets.all(20.0),
      onPressed: this.loading ? null : this.onClick,
      child: this.loading ? spinner() : Text(this.text)
    );
  }

  @override
  Widget fallback(BuildContext context) {
    return FlatButton(
      color: Colors.pink[600],
      textColor: Colors.white,
      padding: EdgeInsets.all(15.0),
      splashColor: Colors.pinkAccent,
      onPressed: this.loading ? null : this.onClick,
      child: this.loading ? spinner() : Text(this.text)
    );
  }

  Widget spinner() {
    return Loading(
      indicator: LineScaleIndicator(),
      size: 25.0,
      color: Colors.pink[600]
    );
  }
}
