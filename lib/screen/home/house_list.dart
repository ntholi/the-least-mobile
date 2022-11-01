import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:theleast/screen/house/house_page.dart';
import 'package:theleast/service/house/house.dart';
import 'package:theleast/service/house/house_service.dart';
import 'package:theleast/ui/progress_bar.dart';

class HouseList extends StatefulWidget {
  const HouseList({Key? key}) : super(key: key);

  @override
  State<HouseList> createState() => _HouseListState();
}

class _HouseListState extends State<HouseList> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getHouses(),
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Center(
              child: Text('${snapshot.error} occurred'),
            );
          } else if (snapshot.hasData) {
            var items = snapshot.data as List<House>;
            return ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                return HouseCard(house: items[index]);
              },
            );
          }
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

class HouseCard extends StatelessWidget {
  final House _house;
  final double _borderRadius = 5;
  const HouseCard({super.key, required House house}) : _house = house;

  @override
  Widget build(BuildContext context) {
    final donated = _house.donated ?? 0;
    return InkWell(
      onTap: () {
        gotoHouse(context, _house);
      },
      child: Container(
        height: 90,
        padding: const EdgeInsets.symmetric(vertical: 4),
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(_borderRadius),
          border: Border.all(
            color: Colors.grey.shade200,
          ),
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage:
                  CachedNetworkImageProvider(_house.imageUrl ?? ''),
              backgroundColor: Colors.grey,
              radius: 45,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: Text(_house.name)),
                    ProgressBar(_house.donated, _house.target),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Donated",
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          "M$donated",
                          style: TextStyle(
                            color: donated > 0 ? Colors.black : Colors.red,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                gotoHouse(context, _house);
              },
              icon: Icon(
                size: 15,
                Icons.arrow_forward_ios_sharp,
                color: Colors.grey.shade400,
              ),
            )
          ],
        ),
      ),
    );
  }
}

void gotoHouse(BuildContext context, House house) {
  Navigator.of(context).push(
    MaterialPageRoute<void>(
      builder: (BuildContext context) => HousePage(house),
    ),
  );
}
