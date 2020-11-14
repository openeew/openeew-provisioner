import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

import 'package:openeew_provisioner/widgets/space.dart';

class StepProgress extends StatelessWidget {
  final double percent;

  const StepProgress(this.percent);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LinearPercentIndicator(
            width: 300,
            percent: percent,
            backgroundColor: Colors.pink[50],
            progressColor: Colors.pink[600],
            linearStrokeCap: LinearStrokeCap.roundAll,
          ),
        ],
      ),
    );
  }
}
