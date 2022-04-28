import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:urbe_solution/clean/presentation/home/bloc/home_bloc.dart';
import 'package:urbe_solution/clean/presentation/show_people/bloc/show_people_bloc.dart';
import 'package:urbe_solution/clean/presentation/show_people/pages/profile_page/profile_page.dart';
import 'package:urbe_solution/clean/presentation/show_people/pages/progress_content.dart';
import 'package:urbe_solution/clean/presentation/show_people/pages/send_report_error_page.dart';
import 'package:urbe_solution/clean/presentation/show_people/pages/send_report_success_page.dart';
import 'package:urbe_solution/theme/app_theme.dart';

class ShowPeopleContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
            appBar: AppBar(
              backgroundColor: Themes.mainTheme(context).colorScheme.primary,
              elevation: 0,
            ),
            backgroundColor: Themes.mainTheme(context).colorScheme.primary,
            body: SafeArea(
                child: MultiBlocListener(
              listeners: [
                BlocListener<ShowPeopleBloc, ShowPeopleState>(
                  listenWhen: (p, c) => c is ReportSendErrorState,
                  listener: (context, state) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SendReportErrorPage(
                              onConfirmPressed: () {
                                Navigator.of(context).pop();
                              },
                            )));
                  },
                ),
                BlocListener<ShowPeopleBloc, ShowPeopleState>(
                    listenWhen: (p, c) => c is ReportSendState,
                    listener: (context, state) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SendReportSuccessPage(
                                onConfirmPressed: () {
                                  Navigator.of(context).pop();
                                },
                              )));
                    })
              ],
              child: BlocBuilder<ShowPeopleBloc, ShowPeopleState>(
                  buildWhen: (p, c) =>
                      (c is CharacterProfileState || c is LoadingProfileState),
                  builder: (context, state) {
                    if (state is CharacterProfileState) {
                      return ProfilePage();
                    } else if (state is LoadingProfileState) {
                      return ProgressContent();
                    } else {
                      return Container();
                    }
                  }),
            ))),
        BlocBuilder<ShowPeopleBloc, ShowPeopleState>(builder: (context, state) {
          return Visibility(
              visible: state is SendingReportState, child: ProgressContent());
        })
      ],
    );
  }
}
