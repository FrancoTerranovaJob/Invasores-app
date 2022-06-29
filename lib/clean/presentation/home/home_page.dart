import 'package:InvadersApp/clean/presentation/invaders/invaders_list/ui/invader_list.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onSecondary,
      drawer: Drawer(),
      appBar: AppBar(
        title: Text('Invaders'),
      ),
      body: SafeArea(
        child: Column(
          children: [Expanded(child: InvaderList())],
        ),
      ),
    );
  }
}