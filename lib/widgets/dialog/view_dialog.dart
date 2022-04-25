import 'package:flutter/material.dart';

class ViewDialog extends StatelessWidget {
  final Widget body;

  final EdgeInsetsGeometry contentPadding;
  const ViewDialog(
      {Key? key,
      required this.body,
      this.contentPadding = const EdgeInsets.fromLTRB(10, 20, 10, 24)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Theme.of(context).colorScheme.surface,
      insetPadding: const EdgeInsets.all(20),
      child: body,
    );
  }
}
