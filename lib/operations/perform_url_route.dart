import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:openeew_provisioner/operations/platform_operation.dart';

import 'package:url_launcher/url_launcher.dart';

class PerformUrlRoute extends PlatformOperation {
  PerformUrlRoute(Map args) : super(args);

  @override
  Future<int> fallback() async {
    if (await canLaunch(this.args['link'])) {
      await launch(this.args['link']);
      return 200;
    } else {
      return 404;
    }
  }
}
