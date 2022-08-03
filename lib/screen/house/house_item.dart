import 'package:theleast/service/house/house.dart';
import 'package:flutter/material.dart';

class HouseItem {
  final House house;

  HouseItem(this.house);

  Widget buildTitle(BuildContext context) => Text(house.name);

  Widget buildSubtitle(BuildContext context) => Text(house.address);
}
