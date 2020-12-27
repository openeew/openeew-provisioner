import 'package:flutter/material.dart';

class HorizontalSpace extends StatelessWidget {
  final int space;

  const HorizontalSpace(this.space);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: this.space / 2)
    );
  }
}
