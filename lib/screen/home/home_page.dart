import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:theleast/screen/house/house_item.dart';
import 'package:theleast/service/house/house.dart';
import 'package:theleast/service/house/house_service.dart';
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
              Expanded(
                child: FutureBuilder(
                  builder: (ctx, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text('${snapshot.error} occurred'),
                        );

                        // if we got our data
                      } else if (snapshot.hasData) {
                        var items = snapshot.data as List<House>;
                        return ListView.builder(
                            padding: const EdgeInsets.all(8),
                            itemCount: items.length,
                            itemBuilder: (BuildContext context, int index) {
                              final houseItem = HouseItem(items[index]);
                              return ListTile(
                                title: houseItem.buildTitle(context),
                                subtitle: houseItem.buildSubtitle(context),
                              );
                            });
                      }
                    }

                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                  future: getHouses(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<ListView> listBuilder() async {
    var items = await getHouses();
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        log("We are at $index with ${items[index]}");
        final item = HouseItem(items[index]);

        return ListTile(
          title: item.buildTitle(context),
          subtitle: item.buildSubtitle(context),
        );
      },
    );
  }
}
