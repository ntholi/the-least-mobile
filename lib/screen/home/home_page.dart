import 'package:flutter/material.dart';
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
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColors.background.withOpacity(0.8),
                Colors.white,
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: AppColors.primaryColor,
                height: 90,
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(child: Logo(fontSize: 20)),
                    CircleAvatar(
                      backgroundColor: Colors.grey.shade100,
                      child: const Text('AH'),
                    )
                  ],
                ),
              ),
              Wrap(
                alignment: WrapAlignment.spaceEvenly,
                spacing: 10,
                children: [
                  const SizedBox(),
                  ActionChip(
                    padding: const EdgeInsets.symmetric(
                      vertical: 11,
                      horizontal: 15,
                    ),
                    label: const Text('All'),
                    onPressed: () {},
                  ),
                  ActionChip(
                    padding: const EdgeInsets.symmetric(
                      vertical: 11,
                      horizontal: 15,
                    ),
                    label: const Text('Favorite'),
                    onPressed: () {},
                  ),
                  ActionChip(
                    padding: const EdgeInsets.symmetric(
                      vertical: 11,
                      horizontal: 15,
                    ),
                    label: const Text('Near You'),
                    onPressed: () {},
                  ),
                ],
              ),
              const Expanded(
                child: HouseList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
