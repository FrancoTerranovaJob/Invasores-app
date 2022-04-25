import 'package:flutter/material.dart';
import 'package:urbe_solution/widgets/progress/progress.dart';

import '../../../../theme/app_theme.dart';

class ProgressPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Themes.mainTheme(context).colorScheme.primary,
      child: Center(child: Progress()),
    );
  }
}
