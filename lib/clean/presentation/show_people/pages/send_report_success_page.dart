import 'package:flutter/material.dart';
import 'package:urbe_solution/theme/app_theme.dart';
import 'package:urbe_solution/widgets/buttons/rounded_button.dart';

class SendReportSuccessPage extends StatelessWidget {
  final Function() onConfirmPressed;

  const SendReportSuccessPage({Key? key, required this.onConfirmPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Themes.mainTheme(context).colorScheme.primary,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Text(
                  '¡Reporte enviado con éxito!',
                  style: Themes.mainTheme(context)
                      .textTheme
                      .headline2!
                      .copyWith(color: Colors.green),
                ),
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
