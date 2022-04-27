import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:urbe_solution/clean/presentation/home/bloc/home_bloc.dart';
import 'package:urbe_solution/clean/presentation/home/pages/data_content.dart';
import 'package:urbe_solution/clean/presentation/show_people/pages/progress_content.dart';

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listenWhen: (p, c) => c is SyncErrorState,
      listener: (bContext, state) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error al sincronizar los datos!')));
      },
      child: BlocBuilder<HomeBloc, HomeState>(
          buildWhen: (p, c) =>
              c is LoadingState || c is DataState || c is ErrorState,
          builder: (context, state) {
            if (state is LoadingState) {
              return ProgressContent();
            } else if (state is DataState ||
                state is ErrorState ||
                state is SyncErrorState) {
              return DataContent();
            } else {
              return Container();
            }
          }),
    );
  }
}
