import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theleast/service/house/house.dart';
import 'package:theleast/service/user/user.dart';
import 'package:theleast/service/user/user_provider.dart';
import 'package:theleast/service/user/user_service.dart';

class FavoriteIndicator extends ConsumerWidget {
  final House house;
  bool isLoading = false;
  FavoriteIndicator(this.house, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isFav = _isFavorite(house, ref.watch(userProvider));
    if (isLoading) {
      return const CircularProgressIndicator();
    }
    return IconButton(
      onPressed: () async {
        isFav ? await removeFavorite(house) : await addFavorite(house);
      },
      icon: Icon(
        isFav ? Icons.star : Icons.star_outline,
        size: 30,
        color: isFav ? Colors.yellow : Colors.white,
      ),
    );
  }

  bool _isFavorite(House house, User? user) {
    if (user == null || user.favoriteHouses == null) {
      return false;
    }
    return user.favoriteHouses!.contains(house.id);
  }
}
