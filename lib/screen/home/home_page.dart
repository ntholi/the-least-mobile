import 'package:flutter/material.dart';
import 'package:theleast/screen/home/filter.dart';
import 'package:theleast/screen/home/header.dart';
import 'package:theleast/screen/house/house_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: "Search",
        ),
      ]),
      body: SafeArea(
        child: Column(
          children: [
            const Header(),
            Container(
              decoration: BoxDecoration(color: Colors.green[300]),
              child: const Filter(),
            ),
            const Flexible(
              child: HouseList(),
            )
          ],
        ),
      ),
    );
  }
}
