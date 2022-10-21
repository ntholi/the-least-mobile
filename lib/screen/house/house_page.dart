import 'package:flutter/material.dart';

class HousePage extends StatelessWidget {
  const HousePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              expandedHeight: 280.0,
              floating: false,
              pinned: true,
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
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Selimo Thabane",
                style: TextStyle(fontSize: 30),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text("Donate"),
        icon: const Icon(Icons.money_outlined),
        onPressed: () {},
      ),
    );
  }
}
