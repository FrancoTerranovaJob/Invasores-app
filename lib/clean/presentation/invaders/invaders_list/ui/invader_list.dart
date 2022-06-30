import 'package:InvadersApp/clean/presentation/invaders/invaders_list/ui/widgets/most_wanted_card.dart';
import 'package:InvadersApp/clean/presentation/invaders/invaders_list/ui/widgets/page_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../invaders_list_bloc/invaders_list_bloc.dart';
import 'widgets/invader_card.dart';
import 'widgets/loading_list.dart';

class InvaderList extends StatelessWidget {
  const InvaderList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InvadersListBloc()..add(NextPageEvent()),
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
          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Text(
                      'Most Wanted',
                      style: Theme.of(context).textTheme.headline1!.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary),
                    ),
                    SizedBox(
                      height: 250,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 2,
                        itemBuilder: (BuildContext context, int index) {
                          return MostWantedInvaderCard(
                              invader: invaderList[index]);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, mainAxisExtent: 300),
                delegate: SliverChildBuilderDelegate(
                    childCount: invaderList.length, (context, index) {
                  return InvaderCard(invader: invaderList[index]);
                }),
              ),
              SliverToBoxAdapter(
                child: Container(
                  color: Theme.of(context).colorScheme.primary,
                  height: 50,
                  child: Center(child: PageButtons()),
                ),
              )
            ],
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