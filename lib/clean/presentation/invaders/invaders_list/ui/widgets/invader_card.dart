import 'package:flutter/material.dart';

import '../../../../../domain/entities/invader.dart';

class InvaderCard extends StatelessWidget {
  final Invader invader;
  const InvaderCard({Key? key, required this.invader}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.network(''),
        ],
      ),
    );
  }
}