import 'package:flutter/material.dart';
import 'package:theleast/screen/home/filter.dart';
import 'package:theleast/screen/home/header.dart';
import 'package:theleast/screen/home/house_list.dart';
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
      appBar: AppBar(
        toolbarHeight: 0,
        elevation: 0,
        toolbarOpacity: 0,
      ),
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                expandedHeight: 240.0,
                floating: false,
                pinned: false,
                title: const Logo(fontSize: 24),
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: const CircleAvatar(
                      radius: 15,
                      backgroundImage: AssetImage('assets/images/avatar.jpg'),
                    ),
                  )
                ],
                flexibleSpace: const FlexibleSpaceBar(
                  centerTitle: true,
                  background: Header(),
                ),
              ),
            ];
          },
          body: Column(
            children: [
              Container(
                decoration:
                    BoxDecoration(color: AppColors.primaryColor.shade400),
                child: const Filter(),
              ),
              const Flexible(
                child: HouseList(),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search",
          ),
        ],
      ),
    );
  }
}
