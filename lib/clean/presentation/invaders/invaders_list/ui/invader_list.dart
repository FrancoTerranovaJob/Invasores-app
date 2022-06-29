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
      create: (context) => InvadersListBloc()..add(GetInvadersEvent()),
      child: _InvaderListView(),
    );
  }
}

class _InvaderListView extends StatelessWidget {
  const _InvaderListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final invaderBloc = BlocProvider.of<InvadersListBloc>(context);
    return BlocBuilder<InvadersListBloc, InvadersListState>(
      builder: (context, state) {
        if (state.invaderStatus == InvadersStatus.data) {
          final invaderList = state.invadersList.invaders;
          return CustomScrollView(
            slivers: [
              SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, mainAxisExtent: 350),
                delegate: SliverChildBuilderDelegate(
                    childCount: invaderList.length, (context, index) {
                  return InvaderCard(invader: invaderList[index]);
                }),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 50,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                            onPressed: () =>
                                invaderBloc.add(PreviousPageEvent()),
                            child: Text('< Previous')),
                        TextButton(
                            onPressed: () => invaderBloc.add(NextPageEvent()),
                            child: Text('Next >'))
                      ],
                    ),
                  ),
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
/*

GridView.builder(
itemCount: invaderList.length,
gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
crossAxisCount: 2, mainAxisExtent: 350),
itemBuilder: (BuildContext context, int index) {
return InvaderCard(invader: invaderList[index]);
},
);*/
