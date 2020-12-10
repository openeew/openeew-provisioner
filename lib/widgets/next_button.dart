import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:openeew_provisioner/operations/perform_route.dart';

import 'package:openeew_provisioner/widgets/button.dart';

class NextButton extends StatelessWidget {
  final Widget route;
  final String text;
  final Function onClick;
  final bool loading;

  const NextButton({ this.route, this.onClick, this.text, this.loading = false });

  @override
  Widget build(BuildContext context) {
    return Button(text: this.text, loading: this.loading, onClick: () {
      if (this.onClick != null) {
        this.onClick(context);
      } else if (this.route != null) {
        PerformRoute({ 'context': context, 'route': this.route }).perform();
      }
    });
  }
}
