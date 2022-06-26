import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:urbe_solution/clean/presentation/invaders/invaders_list/invaders_list_bloc/invaders_list_bloc.dart';

import 'widgets/invader_card.dart';
import 'widgets/loading_list.dart';

class InvaderList extends StatelessWidget {
  const InvaderList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InvadersListBloc()..add(GetInvadersEvent()),
      child: _InvaderListView(),
    );
  }
}

class _InvaderListView extends StatelessWidget {
  const _InvaderListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InvadersListBloc, InvadersListState>(
      builder: (context, state) {
        if (state.invaderStatus == InvadersStatus.data) {
          final invaderList = state.invadersList.invaders;
          return GridView.builder(
            itemCount: invaderList.length,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (BuildContext context, int index) {
              return InvaderCard(invader: invaderList[index]);
            },
          );
        }
        if (state.invaderStatus == InvadersStatus.error) {
          return Container();
        }
        return LoadingList();
      },
    );
  }
}