import 'package:InvadersApp/clean/domain/entities/entities.dart';
import 'package:flutter/material.dart';

class InvaderPortrair extends StatelessWidget {
  final Invader invader;
  const InvaderPortrair({Key? key, required this.invader}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).colorScheme.primary,
      shape: RoundedRectangleBorder(
          side: BorderSide(color: Theme.of(context).colorScheme.onPrimary)),
      content: Image.network(
        invader.imageUrl,
        width: 300,
        height: 300,
      ),
    );
  }
}