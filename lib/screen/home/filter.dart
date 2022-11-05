import 'package:flutter/material.dart';
import 'package:theleast/screen/home/filter_item.dart';

enum FilterMode {
  none("None"),
  recentlyAdded("New"),
  favorite("Favorites"),
  near("Near You");

  final String value;

  const FilterMode(this.value);

  @override
  String toString() => value;
}

class FilterItem {
  final FilterMode mode;
  final String icon;
  FilterItem(this.mode, this.icon);
}

class Filter extends StatefulWidget {
  final ValueSetter setFilterMode;
  const Filter({
    required this.setFilterMode,
    Key? key,
  }) : super(key: key);

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  final items = [
    FilterItem(FilterMode.near, "address"),
    FilterItem(FilterMode.favorite, "star"),
    FilterItem(FilterMode.recentlyAdded, "new"),
  ];

  FilterItem? selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: items
            .map(
              (item) => FilterItemView(
                item: item,
                isSelected: selected == item,
                setSelected: (item) {
                  setState(() {
                    selected = selected != item ? item : null;
                    widget.setFilterMode(selected?.mode ?? FilterMode.none);
                  });
                },
              ),
            )
            .toList(),
      ),
    );
  }
}
