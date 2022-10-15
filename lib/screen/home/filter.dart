import 'package:flutter/material.dart';

class Filter extends StatefulWidget {
  const Filter({
    Key? key,
  }) : super(key: key);

  @override
  State<Filter> createState() => _FilterState();
}

class Item {
  final String label;
  final String icon;
  Item(this.label, this.icon);
}

class _FilterState extends State<Filter> {
  final items = [
    Item("Near You", "address"),
    Item("Favorites", "star"),
    Item("New", "new"),
  ];

  var selected = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      height: 130,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: items.map((item) => FilterItem(item)).toList(),
      ),
    );
  }
}

class FilterItem extends StatelessWidget {
  final Item item;

  const FilterItem(
    this.item, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: 100,
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Column(
          children: [
            SizedBox(
              height: 50,
              width: 50,
              child: Image.asset('assets/images/${item.icon}.png'),
            ),
            Text(
              item.label,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey.shade500,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
      ),
    );
    ;
  }
}
