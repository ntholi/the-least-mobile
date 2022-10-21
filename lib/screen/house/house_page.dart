import 'package:flutter/material.dart';
import 'package:theleast/ui/colors.dart';

class HousePage extends StatelessWidget {
  const HousePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              expandedHeight: 240.0,
              floating: false,
              pinned: true,
              actions: [IconButton(onPressed: () {}, icon: Icon(Icons.star))],
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: const Text(
                  "App Bar",
                ),
                background: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: const AssetImage("assets/images/avatar.jpg"),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                          AppColors.primaryColor.withOpacity(0.4),
                          BlendMode.darken),
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
    );
  }
}
