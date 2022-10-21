import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:theleast/service/house/house.dart';
import 'package:theleast/service/house/house_service.dart';
import 'package:theleast/ui/colors.dart';
import 'package:theleast/ui/prograss_bar.dart';

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
  const HouseCard({super.key, required this.house});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: Colors.grey.shade200,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 90,
            decoration: const BoxDecoration(
              image: DecorationImage(
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
                  const ProgressBar(1, 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Total Raised",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 13,
                        ),
                      ),
                      Text("M400")
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
    );
  }
}
