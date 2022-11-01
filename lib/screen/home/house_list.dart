import 'package:flutter/material.dart';
import 'package:theleast/screen/home/house_card.dart';
import 'package:theleast/service/house/house.dart';
import 'package:theleast/service/house/house_service.dart';

class HouseList extends StatefulWidget {
  const HouseList({Key? key}) : super(key: key);

  @override
  State<HouseList> createState() => _HouseListState();
}

class _HouseListState extends State<HouseList> {
  final _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();
  late List<House> _houses;
  late Future<void> _initData;

  @override
  void initState() {
    super.initState();
    _initData = _loadInitData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initData,
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Center(
              child: Text('${snapshot.error} occurred'),
            );
          } else {
            return RefreshIndicator(
              key: _refreshIndicatorKey,
              onRefresh: _refreshHouses,
              child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: _houses.length,
                itemBuilder: (BuildContext context, int index) {
                  return HouseCard(house: _houses[index]);
                },
              ),
            );
          }
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  Future<void> _loadInitData() async {
    _houses = await getHouses();
  }

  Future<void> _refreshHouses() async {
    final photos = await getHouses();
    setState(() {
      _houses = photos;
    });
  }
}
