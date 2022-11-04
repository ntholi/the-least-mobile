import 'package:flutter/material.dart';
import 'package:theleast/screen/home/filter.dart';
import 'package:theleast/screen/home/house_card.dart';
import 'package:theleast/service/house/house.dart';
import 'package:theleast/service/house/house_service.dart';
import 'package:theleast/service/user/user.dart';

class HouseList extends StatefulWidget {
  final FilterMode filterMode;
  final User? user;
  const HouseList({
    required this.filterMode,
    required this.user,
    Key? key,
  }) : super(key: key);

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
    _houses = await _filteredHouses();
  }

  Future<void> _refreshHouses() async {
    final photos = await _filteredHouses();
    setState(() {
      _houses = photos;
    });
  }

  Future<List<House>> _filteredHouses() async {
    if (widget.filterMode == FilterMode.favorite) {
      return getFavoriteHouses(widget.user);
    }
    return getHouses();
  }
}
