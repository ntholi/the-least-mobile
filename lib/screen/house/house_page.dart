import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:theleast/screen/house/goal_info.dart';
import 'package:theleast/screen/payment/donation_amount_page.dart';
import 'package:theleast/service/house/favorite_indicator.dart';
import 'package:theleast/service/house/house.dart';
import 'package:theleast/service/user/user_service.dart';
import 'package:theleast/ui/button.dart';
import 'package:theleast/ui/colors.dart';

class HousePage extends StatelessWidget {
  final House _house;
  const HousePage(this._house, {super.key});

  @override
  Widget build(BuildContext context) {
    final backgroundImage = CachedNetworkImage(
      imageUrl: _house.imageUrl ?? "",
      placeholder: (context, url) => Container(
        color: Colors.grey.shade700,
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
      imageBuilder: (context, imageProvider) {
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.7),
                BlendMode.darken,
              ),
            ),
          ),
        );
      },
    );

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              expandedHeight: 300.0,
              floating: false,
              pinned: false,
              actions: [
                FavoriteIndicator(_house),
              ],
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: Text(_house.name),
                    ),
                  ],
                ),
                background: backgroundImage,
              ),
            ),
          ];
        },
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                GoalInfo(donated: _house.donated, target: _house.target),
                const SizedBox(height: 20),
                const Text("Description", style: TextStyle(fontSize: 20)),
                Text(_house.description ?? ""),
                const Spacer(),
                Button(
                  onClick: () {
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) =>
                            DonationAmountPage(_house),
                      ),
                    );
                  },
                  title: "Donate",
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
