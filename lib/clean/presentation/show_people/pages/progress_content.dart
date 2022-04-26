import 'package:flutter/material.dart';

import '../../../../theme/app_theme.dart';
import '../../../../widgets/progress/progress.dart';

class ProgressContent extends StatelessWidget {
  final bool showSyncMessage;

  const ProgressContent({Key? key, this.showSyncMessage = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Themes.mainTheme(context).colorScheme.primary,
      child: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Progress(),
          Visibility(
              visible: showSyncMessage,
              child: Text(
                  'Sincronizando... Este proceso puede demorar unos minutos'))
        ],
      )),
    );
  }
}
