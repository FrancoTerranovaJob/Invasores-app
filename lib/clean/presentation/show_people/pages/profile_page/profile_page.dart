import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:urbe_solution/clean/presentation/show_people/bloc/show_people_bloc.dart';
import 'package:urbe_solution/clean/presentation/show_people/pages/profile_page/footer/profile_footer.dart';
import 'package:urbe_solution/clean/presentation/show_people/pages/profile_page/pages/body_details.dart';
import 'package:urbe_solution/clean/presentation/show_people/pages/profile_page/pages/transport_list.dart';
import 'package:urbe_solution/widgets/buttons/rounded_button.dart';

import '../../../../../theme/app_theme.dart';

class ProfilePage extends StatelessWidget {
  final PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return BlocListener<ShowPeopleBloc, ShowPeopleState>(
      listenWhen: (p, c) => c is AnimatePageViewState,
      listener: (context, state) {
        if (state.page == 0) {
          pageController.animateToPage(1,
              duration: Duration(seconds: 1), curve: Curves.easeIn);
          BlocProvider.of<ShowPeopleBloc>(context)
              .add(StartAnimationPageEvent());
        } else {
          pageController.animateToPage(0,
              duration: Duration(seconds: 1), curve: Curves.easeOut);
          BlocProvider.of<ShowPeopleBloc>(context)
              .add(StartAnimationPageEvent());
        }
      },
      child: BlocBuilder<ShowPeopleBloc, ShowPeopleState>(
        buildWhen: (p, c) => c is ShowPeopleInitial,
        builder: (context, state) {
          return Column(
            children: [
              Expanded(
                child: SizedBox(
                  child: Container(
                      color: Themes.mainTheme(context).colorScheme.primary,
                      child: Center(
                        child: Column(
                          children: [
                            Text(
                              state.characterSelected.name,
                              style: Themes.mainTheme(context)
                                  .textTheme
                                  .headline1!
                                  .copyWith(
                                      color: Themes.mainTheme(context)
                                          .colorScheme
                                          .onPrimary),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.my_location_rounded,
                                    color: Themes.mainTheme(context)
                                        .colorScheme
                                        .onBackground,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      state.characterSelected.bornPlanet.name,
                                      style: Themes.mainTheme(context)
                                          .textTheme
                                          .subtitle1!
                                          .copyWith(
                                            color: Themes.mainTheme(context)
                                                .colorScheme
                                                .onBackground
                                                .withOpacity(0.50),
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )),
                ),
              ),
              Expanded(
                flex: 4,
                child: InkWell(
                  splashColor: Colors.transparent,
                  onTap: () {
                    BlocProvider.of<ShowPeopleBloc>(context)
                        .add(StopAnimationEvent());
                  },
                  child: PageView(
                    controller: pageController,
                    onPageChanged: (page) {
                      BlocProvider.of<ShowPeopleBloc>(context)
                          .add(PageChangedEvent(page: page));
                    },
                    children: [
                      BodyDetails(
                        character: state.characterSelected,
                      ),
                      TransportList(
                          transports: state.characterSelected.transports)
                    ],
                  ),
                ),
              ),
              ProfileFooter(
                state: state,
              )
            ],
          );
        },
      ),
    );
  }
}
