import 'package:flutter/material.dart';
import 'package:theleast/screen/home/filter.dart';
import 'package:theleast/ui/colors.dart';

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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: isSelected ? AppColors.primaryColor.shade50 : Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: const Offset(0, 1),
                ),
              ],
              border: Border.all(
                  color: isSelected
                      ? AppColors.primaryColor.shade700
                      : Colors.white),
            ),
            child: SizedBox(
              height: 40,
              width: 40,
              child: Image.asset('assets/images/${item.icon}.png'),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            item.mode.value,
            style: TextStyle(
              fontSize: 12,
              color: isSelected ? Colors.grey.shade700 : Colors.grey.shade400,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}
