import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theleast/screen/landing_page.dart';
import 'package:theleast/screen/payment/methods/add_mpesa.dart';
import 'package:theleast/service/house/house.dart';
import 'package:theleast/service/user/user.dart';
import 'package:theleast/ui/colors.dart';
import 'package:theleast/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final house = //TODO: TO BE DELETED
      House(
          id: "ifjcAYF9NKYHFfygTjue",
          name: "Holima Sekolo",
          address: "address");
  final user = User(
      id: "RlzTDwsRozQ95F3yKnoeljMlj4P2",
      firstName: "Thabo",
      lastName: "Lebese",
      email: "thabo@gmail.com");

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'TheLeast',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: AppColors.primaryColor,
        ),
        home: const LandingPage(),
      ),
    );
  }
}
