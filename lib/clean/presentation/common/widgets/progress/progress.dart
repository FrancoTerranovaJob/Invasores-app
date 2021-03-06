import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Progress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Center(
        child: Lottie.asset('assets/progress/progress_app.json',
            width: 200, height: 200),
      ),
    );
  }
}