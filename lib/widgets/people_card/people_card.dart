import 'package:flutter/material.dart';

class PeopleCard<T> extends StatelessWidget {
  final T item;
  final Widget Function(T item) head;
  final Widget Function(T item) body;
  final Function(T item) onPressed;
  const PeopleCard(
      {Key? key,
      required this.item,
      required this.head,
      required this.body,
      required this.onPressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20))),
      elevation: 5,
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {
          onPressed(item);
        },
        child: Column(
          children: [
            Expanded(child: head(item)),
            Expanded(flex: 2, child: body(item))
          ],
        ),
      ),
    );
  }
}
