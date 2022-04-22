import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:word_guess_app/constants/ad_helper.dart';
import 'package:word_guess_app/screens/home_page.dart';
import 'package:word_guess_app/screens/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AdHelper().initGoogleMobileAds();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}
