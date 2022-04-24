import 'package:flutter/material.dart';
import 'package:urbe_solution/widgets/progress/progress.dart';

class ProgressPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF2E4558),
      child: Center(child: Progress()),
    );
  }
}
