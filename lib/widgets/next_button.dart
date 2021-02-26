import 'package:flutter/material.dart';

import 'package:loading/loading.dart';
import 'package:loading/indicator/line_scale_indicator.dart';

import 'package:openeew_provisioner/operations/perform_route.dart';

import 'package:openeew_provisioner/theme/carbon.dart';

class NextButton extends StatelessWidget {
  final Widget route;
  final String text;
  final Function onClick;
  final double width;
  final bool loading;

  const NextButton({ this.route, this.onClick, this.text, this.width = 178, this.loading = false });

  @override
  Widget build(BuildContext context) {
    if (this.loading) {
      return Loading(
        indicator: LineScaleIndicator(),
        size: 25.0,
      );
    } else {
      return CButton(width: this.width, label: this.text, onTap: () {
        if (this.onClick != null) {
          this.onClick(context);
        } else if (this.route != null) {
          PerformRoute({ 'context': context, 'route': this.route }).perform();
        }
      });
    }
  }
}
