import 'package:InvadersApp/clean/presentation/common/widgets/progress/progress.dart';
import 'package:flutter/material.dart';

class LoadingList extends StatelessWidget {
  const LoadingList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Progress();
  }
}