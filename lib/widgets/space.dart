import 'package:flutter/material.dart';

class Space extends StatelessWidget {
  final int space;

  const Space(this.space);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: this.space / 2)
    );
  }
}
