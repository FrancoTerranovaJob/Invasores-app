import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:urbe_solution/clean/domain/entities/character.dart';
import 'package:urbe_solution/clean/presentation/home/bloc/home_bloc.dart';

import '../../../../theme/app_theme.dart';
import '../../../../widgets/people_card/people_card.dart';

class PeopleListContent extends StatelessWidget {
  final List<Character> people;

  const PeopleListContent({Key? key, required this.people}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;
    final cards = List.generate(people.length, (index) {
      return PeopleCard<Character>(
          item: people[index],
          head: (char) {
            return Container(
              width: double.infinity,
              color: (char.gender == GenderType.female ||
                      char.gender == GenderType.male)
                  ? Themes.mainTheme(context).colorScheme.surface
                  : (char.gender == GenderType.unknown)
                      ? Themes.mainTheme(context).colorScheme.onSurface
                      : (char.gender == GenderType.na)
                          ? Themes.mainTheme(context).colorScheme.primary
                          : Colors.transparent,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    char.name,
                    style: Themes.mainTheme(context)
                        .textTheme
                        .headline2!
                        .copyWith(
                            color: Themes.mainTheme(context)
                                .colorScheme
                                .onBackground),
                  ),
                ),
              ),
            );
          },
          body: (char) {
            return Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Themes.mainTheme(context).colorScheme.onPrimary,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                        width: double.infinity,
                        child: Text(
                          'Genero',
                          style: Themes.mainTheme(context).textTheme.subtitle1,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                        width: double.infinity,
                        child: Text(
                          '${char.gender}',
                          style: Themes.mainTheme(context).textTheme.subtitle2,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                        width: double.infinity,
                        child: Text(
                          'Altura (cm)',
                          style: Themes.mainTheme(context).textTheme.subtitle1,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                        width: double.infinity,
                        child: Text(
                          '${char.height}',
                          style: Themes.mainTheme(context).textTheme.subtitle2,
                        )),
                  ),
                ],
              ),
            );
          });
    });
    return Container(
      color: Themes.mainTheme(context).colorScheme.primary,
      child: Container(
        color: Themes.mainTheme(context)
            .colorScheme
            .onBackground
            .withOpacity(0.15),
        child: Column(
          children: [
            Expanded(
                child: GridView.count(
              childAspectRatio: (itemWidth / itemHeight),
              crossAxisCount: 2,
              children: cards,
            )),
          ],
        ),
      ),
    );
  }
}
