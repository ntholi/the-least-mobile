import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:theleast/screen/house/house_page.dart';
import 'package:theleast/ui/colors.dart';
import 'package:theleast/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TheLeast',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: AppColors.primaryColor,
      ),
      home: const HousePage(), //LandingPage(),
    );
  }
}
