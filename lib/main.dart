import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:theleast/ui/colors.dart';
import 'package:theleast/firebase_options.dart';
import 'package:theleast/screen/landing_page.dart';
import 'package:flutter/services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //Changes status bar only for android
  //https://stackoverflow.com/questions/52489458/how-to-change-status-bar-color-in-flutter
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(statusBarColor: Colors.green[900]),
  );

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
      home: const LandingPage(),
    );
  }
}
