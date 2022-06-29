import 'package:InvadersApp/clean/presentation/invaders/invaders_list/invaders_list_bloc/invaders_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PageButtons extends StatelessWidget {
  const PageButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final invaderBloc = BlocProvider.of<InvadersListBloc>(context);
    final buttonStyle = Theme.of(context)
        .textTheme
        .subtitle2!
        .copyWith(color: Theme.of(context).colorScheme.onPrimary);
    final buttonStyleDisabled = Theme.of(context).textTheme.subtitle2!.copyWith(
        color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5));
    return BlocBuilder<InvadersListBloc, InvadersListState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              onPressed: state.enablePreviousButton
                  ? () => invaderBloc.add(PreviousPageEvent())
                  : null,
              child: Text('< Previous',
                  style: state.enablePreviousButton
                      ? buttonStyle
                      : buttonStyleDisabled),
            ),
            TextButton(
                onPressed: state.enableNextButton
                    ? () => invaderBloc.add(NextPageEvent())
                    : null,
                child: Text('Next >',
                    style: state.enableNextButton
                        ? buttonStyle
                        : buttonStyleDisabled))
          ],
        );
      },
    );
  }
}