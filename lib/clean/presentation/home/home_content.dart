import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:urbe_solution/clean/presentation/home/bloc/home_bloc.dart';

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<HomeBloc, HomeState>(builder: (bContext, state) {
          if (state is LoadingState) {
            return Container(
              color: Colors.yellow,
            );
          } else if (state is DataState) {
            return ListView.separated(
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(state.data.characters[index].name),
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
                itemCount: state.data.characters.length);
            return Container(
              color: Colors.green,
            );
          } else if (state is ErrorState) {
            return Container(
              color: Colors.purple,
            );
          } else {
            return Container(
              color: Colors.blue,
            );
          }
        }),
      ),
    );
  }
}
