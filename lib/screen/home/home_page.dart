import 'package:flutter/material.dart';
import 'package:theleast/screen/home/filter.dart';
import 'package:theleast/screen/home/header.dart';
import 'package:theleast/screen/house/house_list.dart';
import 'package:theleast/ui/colors.dart';
import 'package:theleast/ui/logo.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Header(),
            Container(
              decoration: BoxDecoration(color: Colors.green[300]),
              child: const Filter(),
            ),
          ],
        ),
      ),
    );
  }
}
