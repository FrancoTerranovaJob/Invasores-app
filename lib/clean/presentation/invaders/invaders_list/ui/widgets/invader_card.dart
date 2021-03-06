import 'package:InvadersApp/clean/domain/entities/entities.dart';
import 'package:InvadersApp/clean/presentation/invaders/invaders_list/ui/widgets/invader_portrair.dart';
import 'package:flutter/material.dart';

class InvaderCard extends StatelessWidget {
  final Invader invader;

  const InvaderCard({Key? key, required this.invader}) : super(key: key);

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
      color: Theme.of(context).colorScheme.primary,
      elevation: 10.0,
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                radius: 100,
                onTap: () async {
                  await showDialog(
                      context: context,
                      builder: (BuildContext context) =>
                          InvaderPortrair(invader: invader));
                },
                child: CircleAvatar(
                  radius: 100,
                  backgroundImage: NetworkImage(invader.imageUrl),
                ),
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