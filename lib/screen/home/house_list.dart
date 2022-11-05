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

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _loadData(),
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Center(
              child: Text('${snapshot.error} occurred'),
            );
          } else {
            return RefreshIndicator(
              key: _refreshIndicatorKey,
              onRefresh: _refresh,
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

  Future<void> _loadData() async {
    _houses = await _filteredHouses();
  }

  Future<void> _refresh() async {
    final list = await _filteredHouses();
    setState(() {
      _houses = list;
    });
  }

  Future<List<House>> _filteredHouses() async {
    if (widget.filterMode == FilterMode.all) {
      return getHouses();
    } else if (widget.filterMode == FilterMode.favorite) {
      return getFavoriteHouses(widget.user);
    } else if (widget.filterMode == FilterMode.recentlyAdded) {
      return getHousesByNewest();
    }
    return [];
  }
}
