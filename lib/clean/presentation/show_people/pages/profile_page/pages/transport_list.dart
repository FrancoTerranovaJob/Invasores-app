import 'package:flutter/material.dart';

import '../../../../../../theme/app_theme.dart';
import '../../../../../domain/entities/transport.dart';

class TransportList extends StatelessWidget {
  final List<Transport> transports;

  const TransportList({Key? key, required this.transports}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Naves y vehiculos',
            style: Themes.mainTheme(context).textTheme.headline2!.copyWith(
                color: Themes.mainTheme(context).colorScheme.onBackground),
          ),
        ),
        Expanded(
          child: ListView.separated(
            itemCount: transports.length,
            itemBuilder: (context, index) {
              return ListTile(
                tileColor: Themes.mainTheme(context)
                    .colorScheme
                    .onBackground
                    .withOpacity(0.50),
                title: Text(
                  transports[index].name,
                  style: Themes.mainTheme(context)
                      .textTheme
                      .subtitle1!
                      .copyWith(
                          color:
                              Themes.mainTheme(context).colorScheme.background),
                ),
                trailing: Text(
                  transports[index].type == TransportType.starship
                      ? 'nave'
                      : 'vehiculo',
                  style: Themes.mainTheme(context)
                      .textTheme
                      .subtitle1!
                      .copyWith(
                          color: Themes.mainTheme(context)
                              .colorScheme
                              .onBackground
                              .withOpacity(0.75)),
                ),
              );
              // return Text('${state.characterSelected.transports[index]}');
            },
            separatorBuilder: (context, index) => Divider(
              height: 5,
            ),
          ),
        )
      ],
    );
  }
}
