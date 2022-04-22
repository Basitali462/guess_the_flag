import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:word_guess_app/screens/home_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);
  Future<double> get _opacity => Future<double>.value(1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        //alignment: Alignment.center,
        /*mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,*/
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Spacer(),
          FutureBuilder<double>(
              future: _opacity,
              initialData: 0,
              builder: (context, snapshot) {
                return AnimatedOpacity(
                  opacity: snapshot.data!,
                  duration: Duration(milliseconds: 2000),
                  child: Image.asset(
                    'assets/images/flag-globe-splash.png',
                  ),
                );
              }),
          FutureBuilder<double>(
            future: _opacity,
              initialData: 0,
              builder: (context, snapshot) {
            return AnimatedOpacity(
              opacity: snapshot.data!,
              duration: Duration(milliseconds: 2000),
              child: GestureDetector(
                onTap: (){
                  Get.to(HomePage());
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 18),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.green,
                        Colors.lightGreen,
                      ],
                    ),
                  ),
                  child: Text(
                    'Let\'s Begin'.toUpperCase(),
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            );
          }),
          Spacer(),
          Image.asset(
            'assets/images/country-flags-splash.png',
            scale: 1,
          ),
        ],
      ),
    );
      /*AnimatedSplashScreen(
      disableNavigation: true,
      duration: 500000,
      splashIconSize: 500,
      splash: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          AnimatedContainer(
            duration: Duration(seconds: 1),
            curve: Curves.bounceIn,
            child: Image.asset(
              'assets/images/flag-globe-splash.png',
              width: 180,
              height: 180,
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                'assets/images/country-flags-splash.png',
              ),
            ),
          ),
        ],
      ),
      nextScreen: HomePage(),)*/;
  }
}
