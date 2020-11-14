import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

import 'package:openeew_provisioner/widgets/space.dart';

class StepProgress extends StatelessWidget {
  final int step;

  const StepProgress(this.step);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LinearPercentIndicator(
            width: 250,
            percent: (this.step / 5),
            backgroundColor: Colors.pink[50],
            progressColor: Colors.pink[600],
            linearStrokeCap: LinearStrokeCap.roundAll,
          ),
        ],
      ),
    );
  }
}
