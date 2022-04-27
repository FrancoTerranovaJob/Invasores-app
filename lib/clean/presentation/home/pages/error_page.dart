import 'package:flutter/material.dart';
import 'package:urbe_solution/theme/app_theme.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Ups, ocurrió un error al cargar los datos!',
          textAlign: TextAlign.center,
          style: Themes.mainTheme(context)
              .textTheme
              .headline1!
              .copyWith(color: Themes.mainTheme(context).colorScheme.onSurface),
        ),
        Text(
          'Intenta sincronizar nuevamente mas tarde',
          textAlign: TextAlign.center,
          style: Themes.mainTheme(context)
              .textTheme
              .subtitle1!
              .copyWith(color: Themes.mainTheme(context).colorScheme.onSurface),
        ),
      ],
    );
  }
}
