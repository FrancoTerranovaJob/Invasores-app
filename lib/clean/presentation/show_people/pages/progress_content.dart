import 'package:flutter/material.dart';

import '../../../../theme/app_theme.dart';
import '../../../../widgets/progress/progress.dart';

class ProgressContent extends StatelessWidget {
  const ProgressContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Themes.mainTheme(context).colorScheme.primary,
          child: Center(child: Progress()),
        ),
      ),
    );
  }
}
