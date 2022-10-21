import 'package:flutter/material.dart';
import 'package:theleast/screen/house/goal_info.dart';

class HousePage extends StatelessWidget {
  const HousePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              expandedHeight: 300.0,
              floating: false,
              pinned: false,
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.star_outline,
                    size: 30,
                    color: Colors.white,
                  ),
                )
              ],
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: const Text(
                  "Selimo Thabane",
                ),
                background: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: const AssetImage(
                          "assets/images/delete-this-image.jpg"),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.7),
                        BlendMode.darken,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ];
        },
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                GoalInfo(donated: 200, target: 300),
                SizedBox(height: 20),
                Text("Description", style: TextStyle(fontSize: 20)),
                Text(
                    "This is a short description that describes this and that and stuff")
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        elevation: 1,
        label: SizedBox(
          width: MediaQuery.of(context).size.width / 2,
          child: const Center(child: Text("Donate")),
        ),
        backgroundColor: Colors.grey.shade900,
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
