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

            // if we got our data
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
  final House house;
  final double borderRadius = 5;
  const HouseCard({super.key, required this.house});

  @override
  Widget build(BuildContext context) {
    final donated = house.donated ?? 0;
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (BuildContext context) => HousePage(house),
          ),
        );
      },
      child: Container(
        height: 80,
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(
            color: Colors.grey.shade200,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(borderRadius),
                  bottomLeft: Radius.circular(borderRadius),
                ),
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/avatar.jpg"),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: Text(house.name)),
                    ProgressBar(house.donated, house.target),
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
                              color: donated > 0 ? Colors.black : Colors.red),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            IconButton(
              onPressed: () {},
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
