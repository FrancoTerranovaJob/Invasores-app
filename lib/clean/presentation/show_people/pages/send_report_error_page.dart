import 'package:flutter/material.dart';

import '../../../../theme/app_theme.dart';
import '../../../../widgets/buttons/rounded_button.dart';

class SendReportErrorPage extends StatelessWidget {
  final Function() onConfirmPressed;

  const SendReportErrorPage({Key? key, required this.onConfirmPressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Themes.mainTheme(context).colorScheme.primary,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Error al reportar',
                    textAlign: TextAlign.center,
                    style: Themes.mainTheme(context)
                        .textTheme
                        .headline1!
                        .copyWith(
                            color: Themes.mainTheme(context).colorScheme.error),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'intentalo más tarde',
                      textAlign: TextAlign.center,
                      style: Themes.mainTheme(context)
                          .textTheme
                          .headline2!
                          .copyWith(
                              color:
                                  Themes.mainTheme(context).colorScheme.error),
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: RoundedButton(
                    enabledColor:
                        Themes.mainTheme(context).colorScheme.onPrimary,
                    disabledColor:
                        Themes.mainTheme(context).colorScheme.onSecondary,
                    textColor:
                        Themes.mainTheme(context).colorScheme.onBackground,
                    text: 'Volver',
                    onPressed: onConfirmPressed),
              ),
            )
          ],
        ),
      ),
    );
  }
}
