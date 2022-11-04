import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theleast/service/user/user.dart';

final userProvider = StateNotifierProvider<UserState, User?>((ref) {
  return UserState();
});

class UserState extends StateNotifier<User?> {
  UserState() : super(null);

  void setUser(User? user) {
    state = user;
  }
}
