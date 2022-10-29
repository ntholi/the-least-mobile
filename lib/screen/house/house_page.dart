import 'package:flutter/material.dart';
import 'package:theleast/screen/house/goal_info.dart';
import 'package:theleast/screen/payment/donation_amount_page.dart';
import 'package:theleast/service/house/house.dart';
import 'package:theleast/ui/button.dart';
import 'package:theleast/ui/colors.dart';

class HousePage extends StatelessWidget {
  final House _house;
  const HousePage(this._house, {super.key});

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
                title: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: Text(_house.name),
                    ),
                  ],
                ),
                background: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(_house.image ?? ''),
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
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const GoalInfo(donated: 200, target: 300),
                const SizedBox(height: 20),
                const Text("Description", style: TextStyle(fontSize: 20)),
                const Text(
                    "This is a short description that describes this and that and stuff"),
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
                  backgroundColor: AppColors.darkButton,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
