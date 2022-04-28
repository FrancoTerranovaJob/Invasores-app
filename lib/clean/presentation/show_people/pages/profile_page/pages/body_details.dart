import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:urbe_solution/clean/domain/entities/character.dart';

import '../../../../../../theme/app_theme.dart';

class BodyDetails extends StatelessWidget {
  final Character character;

  const BodyDetails({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Datos Físicos',
          style: Themes.mainTheme(context).textTheme.headline2!.copyWith(
              color: Themes.mainTheme(context).colorScheme.onBackground),
        ),
        Expanded(
            child: ListView.builder(
          itemCount: 3,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: Container(
                width: 30,
                height: 30,
                child: SvgPicture.asset(
                  'assets/svgs/point.svg',
                  color: Themes.mainTheme(context)
                      .colorScheme
                      .onPrimary
                      .withOpacity(0.70),
                ),
              ),
              title: Text(
                index == 0
                    ? 'Color de cabello'
                    : index == 1
                        ? 'Color de piel'
                        : 'Color de ojos',
                style: Themes.mainTheme(context).textTheme.subtitle1!.copyWith(
                    color: Themes.mainTheme(context)
                        .colorScheme
                        .onBackground
                        .withOpacity(0.75)),
              ),
              trailing: Text(
                  index == 0
                      ? _parseAttribute(character.hairColor)
                      : index == 1
                          ? _parseAttribute(character.skinColor)
                          : _parseAttribute(character.eyesColor),
                  style: Themes.mainTheme(context)
                      .textTheme
                      .subtitle1!
                      .copyWith(
                          color:
                              Themes.mainTheme(context).colorScheme.onPrimary)),
            );
          },
        )),
      ],
    );
  }

  String _parseAttribute(String attribute) {
    if (attribute == 'none' || attribute == 'n/a') {
      return ' - ';
    } else if (attribute == 'unknown') {
      return 'desconocido';
    } else {
      return attribute;
    }
  }
}
