import 'package:flutter/material.dart';
import 'package:theleast/screen/home/filter.dart';

class FilterItemView extends StatelessWidget {
  final FilterItem item;
  final bool isSelected;
  final ValueSetter<FilterItem> setSelected;

  const FilterItemView({
    required this.item,
    required this.isSelected,
    required this.setSelected,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setSelected(item),
      child: Column(
        children: [
          Container(
            width: 100,
            margin: const EdgeInsets.only(right: 10),
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              border:
                  Border.all(color: isSelected ? Colors.black : Colors.white),
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
                  item.mode.value,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade500,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
