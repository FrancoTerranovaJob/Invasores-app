import 'package:flutter/material.dart';

import 'lateral_drawer_content.dart';

class LateralDrawerScreen extends StatelessWidget {
  final Function(bool isOnline) onModeChanged;
  final Function() onSyncPressed;

  const LateralDrawerScreen(
      {Key? key, required this.onModeChanged, required this.onSyncPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LateralDrawerContent(
      onModeChanged: onModeChanged,
      onSyncPressed: onSyncPressed,
    );
  }
}
