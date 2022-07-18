import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:theleast/colors.dart';
import 'package:theleast/firebase_options.dart';
import 'package:theleast/screen/home_page.dart';

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
      theme: ThemeData(
        primarySwatch: AppColors.primaryColor,
      ),
      home: const HomePage(),
    );
  }
}
