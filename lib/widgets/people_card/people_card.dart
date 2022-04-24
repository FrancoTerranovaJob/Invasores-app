import 'package:flutter/material.dart';

class PeopleCard<T> extends StatelessWidget {
  final T item;
  final Widget Function(T item) head;
  final Widget Function(T item) body;

  const PeopleCard(
      {Key? key, required this.item, required this.head, required this.body})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Column(
        children: [
          Expanded(child: head(item)),
          Expanded(flex: 2, child: body(item))
        ],
      ),
    );
  }
}
