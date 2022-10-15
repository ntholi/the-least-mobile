import 'package:flutter/material.dart';

class Filter extends StatefulWidget {
  const Filter({
    Key? key,
  }) : super(key: key);

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  final items = ["Near You", "Favorites", "Something Else"];
  var selected = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(8),
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: const EdgeInsets.only(right: 10),
            child: ChoiceChip(
              side: const BorderSide(color: Colors.grey),
              padding: const EdgeInsets.all(13),
              backgroundColor: Colors.white,
              label: Text(items[index]),
              labelStyle: TextStyle(
                color: items[index] == selected ? Colors.white : Colors.black,
              ),
              selected: items[index] == selected,
              selectedColor: Colors.black87,
              onSelected: (bool value) {
                setState(() {
                  selected = value ? items[index] : "";
                });
              },
            ),
          );
        },
      ),
    );
  }
}
