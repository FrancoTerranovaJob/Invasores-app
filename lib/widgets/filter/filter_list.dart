import 'package:flutter/material.dart';

class FilterList<T> extends StatelessWidget {
  final List<T> items;
  final String Function(T item) parseText;
  final Function(T item) onItemSelected;
  final bool Function(T item) isSelected;
  final void Function() onItemDeselected;
  const FilterList(
      {Key? key,
      required this.items,
      required this.parseText,
      required this.onItemSelected,
      required this.isSelected,
      required this.onItemDeselected})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ChoiceChip(
            label: Text(parseText(items[index])),
            selected: isSelected(items[index]),
            onSelected: (bool selected) {
              if (selected) {
                onItemSelected(items[index]);
              } else {
                onItemDeselected();
              }
            },
          ),
        );
      },
    );
  }
}
