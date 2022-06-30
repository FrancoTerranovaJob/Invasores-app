import 'package:InvadersApp/clean/domain/entities/entities.dart';
import 'package:flutter/material.dart';

class MostWantedInvaderCard extends StatelessWidget {
  final Invader invader;

  const MostWantedInvaderCard({Key? key, required this.invader})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle infoStyle = Theme.of(context)
        .textTheme
        .subtitle1!
        .copyWith(color: Theme.of(context).colorScheme.onPrimary);
    final TextStyle subtitleStyle = Theme.of(context)
        .textTheme
        .subtitle2!
        .copyWith(color: Theme.of(context).colorScheme.onBackground);
    return Card(
      shape: RoundedRectangleBorder(
          side: BorderSide(color: Theme.of(context).colorScheme.onPrimary)),
      color: Theme.of(context).colorScheme.surface.withOpacity(0.7),
      elevation: 10.0,
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 100,
                backgroundImage: NetworkImage(invader.imageUrl),
              ),
            ),
          ),
          Expanded(
              child: Column(
            children: [
              Text(
                'Name',
                style: infoStyle,
              ),
              Text(
                '${invader.name}',
                style: subtitleStyle,
              ),
              Text(
                'Height',
                style: infoStyle,
              ),
              Text(
                '${invader.height} cm',
                style: subtitleStyle,
              )
            ],
          ))
        ],
      ),
    );
  }
}