import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:openeew_provisioner/operations/platform_operation.dart';

class PerformRoute extends PlatformOperation {
  PerformRoute(Map args) : super(args);

  @override
  void ios() {
    Navigator.push(this.args['context'], CupertinoPageRoute(builder: (context) => this.args['route']));
  }

  @override
  void fallback() {
    Navigator.push(this.args['context'], MaterialPageRoute(builder: (context) => this.args['route']));
  }
}
