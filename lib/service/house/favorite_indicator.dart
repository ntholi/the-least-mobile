import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theleast/service/house/house.dart';
import 'package:theleast/service/user/user.dart';
import 'package:theleast/service/user/user_provider.dart';
import 'package:theleast/service/user/user_service.dart';

class FavoriteIndicator extends ConsumerStatefulWidget {
  final House house;
  bool isLoading = false;
  FavoriteIndicator(this.house, {super.key});

  @override
  FavoriteIndicatorState createState() => FavoriteIndicatorState();
}

class FavoriteIndicatorState extends ConsumerState<FavoriteIndicator> {
  @override
  Widget build(BuildContext context) {
    bool isFav = _isFavorite(widget.house, ref.watch(userProvider));
    if (widget.isLoading) {
      return Container(
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.symmetric(vertical: 18),
        width: 20,
        child: const CircularProgressIndicator(
          color: Colors.white,
          strokeWidth: 2,
        ),
      );
    }
    return IconButton(
      onPressed: () async {
        setState(() {
          widget.isLoading = true;
        });

        final userState = ref.read(userProvider.notifier);
        if (isFav) {
          userState.removeFavorite(widget.house);
          removeFavorite(widget.house).then((success) {
            setState(() {
              widget.isLoading = !success;
            });
          });
        } else {
          userState.addFavorite(widget.house);
          addFavorite(widget.house).then((success) {
            setState(() {
              widget.isLoading = !success;
            });
          });
        }
      },
      icon: Icon(
        isFav ? Icons.star : Icons.star_outline,
        size: 30,
        color: isFav ? Colors.yellow : Colors.white,
      ),
    );
  }
}

bool _isFavorite(House house, User? user) {
  if (user == null || user.favoriteHouses == null) {
    return false;
  }
  return user.favoriteHouses!.contains(house.id);
}
