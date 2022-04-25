import 'package:flutter/material.dart';

import '../../../../theme/app_theme.dart';
import '../../../../widgets/dialog/view_dialog.dart';

class ChangeModeDialogContent extends StatefulWidget {
  final Function(bool syncData) onConfirm;
  final Function() onCancel;

  const ChangeModeDialogContent(
      {Key? key, required this.onConfirm, required this.onCancel})
      : super(key: key);
  @override
  State<StatefulWidget> createState() => ChangeModeDialogState();
}

class ChangeModeDialogState extends State<ChangeModeDialogContent> {
  bool syncSelected = false;
  @override
  Widget build(BuildContext context) {
    return ViewDialog(
        body: Container(
      color: Themes.mainTheme(context).colorScheme.primary,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Modo Online',
              style: Themes.mainTheme(context).textTheme.headline1!.copyWith(
                  color: Themes.mainTheme(context).colorScheme.onPrimary),
            ),
          ),
          SizedBox(
            height: 200,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text.rich(
                    TextSpan(children: <InlineSpan>[
                      TextSpan(
                          text: '¡Advertencia! ',
                          style: Themes.mainTheme(context)
                              .textTheme
                              .subtitle2!
                              .copyWith(
                                  color: Themes.mainTheme(context)
                                      .colorScheme
                                      .error)),
                      TextSpan(
                          text: 'Conectarte te hará vulnerable a rastreos.',
                          style: Themes.mainTheme(context)
                              .textTheme
                              .subtitle2!
                              .copyWith(
                                  color: Themes.mainTheme(context)
                                      .colorScheme
                                      .onBackground))
                    ]),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(
                      'Sincronizar datos',
                      style: Themes.mainTheme(context)
                          .textTheme
                          .subtitle1!
                          .copyWith(
                              color: Themes.mainTheme(context)
                                  .colorScheme
                                  .onBackground),
                    ),
                    subtitle: Text(
                        'Trae nuevamente todos los datos disponibles.',
                        style: Themes.mainTheme(context)
                            .textTheme
                            .subtitle2!
                            .copyWith(
                                color: Themes.mainTheme(context)
                                    .colorScheme
                                    .onBackground
                                    .withOpacity(0.50))),
                    trailing: Checkbox(
                      activeColor:
                          Themes.mainTheme(context).colorScheme.onPrimary,
                      value: syncSelected,
                      onChanged: (newValue) {
                        setState(() {
                          syncSelected = newValue!;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                  onPressed: () {
                    widget.onCancel();
                  },
                  child: Text(
                    'Cancelar',
                    style: Themes.mainTheme(context)
                        .textTheme
                        .subtitle1!
                        .copyWith(
                            color: Themes.mainTheme(context)
                                .colorScheme
                                .onBackground),
                  )),
              TextButton(
                  onPressed: () {
                    widget.onConfirm(syncSelected);
                  },
                  child: Text('Confirmar',
                      style: Themes.mainTheme(context)
                          .textTheme
                          .subtitle1!
                          .copyWith(
                              color: Themes.mainTheme(context)
                                  .colorScheme
                                  .onBackground))),
            ],
          )
        ],
      ),
    ));
  }
}
