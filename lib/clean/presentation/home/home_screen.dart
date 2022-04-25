import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:urbe_solution/clean/presentation/drawer/bloc/lateral_drawer_bloc.dart';
import 'package:urbe_solution/clean/presentation/home/bloc/home_bloc.dart';

import 'home_content.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                LateralDrawerBloc()..add(InitializeDrawerEvent())),
        BlocProvider(
          create: (context) => HomeBloc()..add(LoadDataEvent()),
        )
      ],
      child: HomeContent(),
    );
  }
}
