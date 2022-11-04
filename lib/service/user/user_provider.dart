import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theleast/service/house/house.dart';
import 'package:theleast/service/user/user.dart';

final userProvider = StateNotifierProvider<UserState, User?>((ref) {
  return UserState();
});

class UserState extends StateNotifier<User?> {
  UserState() : super(null);

  void setUser(User? user) {
    state = user;
  }

  void addFavorite(House house) {
    final list = List.from(state?.favoriteHouses ?? []);
    if (!list.contains(house.id)) {
      list.add(house.id);
    }
    state = state?.copyWith(favoriteHouses: list);
  }

  void removeFavorite(House house) {
    final list = List.from(state?.favoriteHouses ?? []);
    list.remove(house.id);
    state = state?.copyWith(favoriteHouses: list);
  }
}
