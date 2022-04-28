import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../../theme/app_theme.dart';
import '../../../../../../widgets/buttons/rounded_button.dart';
import '../../../bloc/show_people_bloc.dart';

class ProfileFooter extends StatelessWidget {
  final ShowPeopleState state;
  final Function() onReportPressed;

  const ProfileFooter(
      {Key? key, required this.state, required this.onReportPressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        width: double.infinity,
        color: Themes.mainTheme(context).colorScheme.primary,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<ShowPeopleBloc, ShowPeopleState>(
                builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: AnimatedSmoothIndicator(
                  activeIndex: state.page,
                  count: 2,
                  effect: ScrollingDotsEffect(
                      activeDotColor:
                          Themes.mainTheme(context).colorScheme.onPrimary),
                ),
              );
            }),
            state.enableReportButton
                ? Text(
                    '¿Vio alguien parecido?',
                    style: Themes.mainTheme(context)
                        .textTheme
                        .subtitle1!
                        .copyWith(
                            color: Themes.mainTheme(context)
                                .colorScheme
                                .onBackground),
                  )
                : Text.rich(TextSpan(children: [
                    TextSpan(
                        text: 'Para reportar debes estar ',
                        style: Themes.mainTheme(context)
                            .textTheme
                            .subtitle1!
                            .copyWith(
                                color: Themes.mainTheme(context)
                                    .colorScheme
                                    .onBackground)),
                    TextSpan(
                        text: 'online',
                        style: Themes.mainTheme(context)
                            .textTheme
                            .subtitle1!
                            .copyWith(color: Colors.green))
                  ])),
            Padding(
              padding:
                  const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
              child: RoundedButton(
                  enabledColor: Themes.mainTheme(context).colorScheme.onPrimary,
                  disabledColor: Themes.mainTheme(context)
                      .colorScheme
                      .onBackground
                      .withOpacity(0.50),
                  textColor: Colors.black,
                  text: 'Reportar',
                  onPressed: state.enableReportButton ? onReportPressed : null),
            )
          ],
        ),
      ),
    );
  }
}
