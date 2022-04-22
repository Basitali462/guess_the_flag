import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:word_guess_app/constants/controller_holder.dart';
import 'package:word_guess_app/constants/widgets/custom_app_bar.dart';
import 'package:word_guess_app/constants/widgets/game_main_board.dart';
import 'package:word_guess_app/constants/widgets/keyBoard_widgets/custom_keyBoard.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void dispose() {
    // TODO: implement dispose
    adController.bannerAd.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    activeFlagController.getRandomFlagNumber();
    print(adController.isBannerAdReady);
    adController.loadBannerAd();
    adController.loadRewardedAd();
    print(adController.isBannerAdReady);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CustomAppBar(),
      ),
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.topCenter,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //SizedBox(height: 20,),
            GameMainBoard(),
            //Spacer(flex: 2,),
            Obx(() => Padding(
              padding: EdgeInsets.only(
                bottom: adController.isBannerAdReady.value
                    ? adController.bannerAd.size.height.toDouble() + 18.0
                    : 24,
              ),
              child: CustomKeyBoard(),
            ),),
            Obx(() => Align(
              alignment: Alignment.bottomCenter,
              child: adController.isBannerAdReady.value ? Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  color: Colors.transparent,
                  height: adController.bannerAd.size.height.toDouble(),
                  width: adController.bannerAd.size.width.toDouble(),
                  child: AdWidget(
                    ad: adController.bannerAd,
                  ),
                ),
              ) : SizedBox(),
            ),),
            //Spacer(flex: 1,),
          ],
        ),
      ),
      //bottomNavigationBar:
    );
  }
}
