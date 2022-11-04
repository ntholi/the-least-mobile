import 'package:flutter/material.dart';
import 'package:theleast/service/house/house.dart';
import 'package:theleast/service/user/user.dart';
import 'package:theleast/service/user/user_service.dart';

class FavoriteIndicator extends StatefulWidget {
  final House house;
  const FavoriteIndicator(this.house, {super.key});

  @override
  State<FavoriteIndicator> createState() => FavoriteStateIndicator();
}

class FavoriteStateIndicator extends State<FavoriteIndicator> {
  @override
  Widget build(BuildContext context) {
    if (_isFavorite(widget.house, null)) {
      return IconButton(
        onPressed: () async {
          await addToFavorites(widget.house);
        },
        icon: const Icon(
          Icons.star_outline,
          size: 30,
          color: Colors.white,
        ),
      );
    } else {
      return CircularProgressIndicator();
    }
  }

  bool _isFavorite(House house, User? user) {
    return true;
  }
}
