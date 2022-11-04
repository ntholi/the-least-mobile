import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theleast/screen/home/filter.dart';
import 'package:theleast/screen/home/header.dart';
import 'package:theleast/screen/home/house_list.dart';
import 'package:theleast/service/user/user_provider.dart';
import 'package:theleast/service/user/user_service.dart';
import 'package:theleast/ui/colors.dart';
import 'package:theleast/ui/logo.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    super.initState();

    String? userId = firebase_auth.FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) {
      throw StateError("Unable to get logged-in user details");
    }

    getUser(userId).then((user) {
      ref.read(userProvider.notifier).setUser(user);
    });
  }

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
