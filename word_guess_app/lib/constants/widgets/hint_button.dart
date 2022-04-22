import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../screens/hint_page.dart';
import '../controller_holder.dart';

class HintButton extends StatelessWidget {
  const HintButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.defaultDialog(
          title: 'Watch Video',
          content: Icon(
            Icons.videocam,
            color: Colors.red,
            size: 40,
          ),
          //textConfirm: 'Try Again',
          confirm: GestureDetector(
            onTap: (){
              print('Pressing watch Video');
              if(adController.isRewardedAdReady.value){
                adController.rewardedAd.show(
                  onUserEarnedReward: (AdWithoutView ad, RewardItem reward){
                    Get.to(HintPage());
                  },
                );
              }else{
                print('No video to watch');
              }
              Get.back();
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Colors.red,
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black45,
                      blurRadius: 1,
                      spreadRadius: 1,
                    ),
                  ]
              ),
              child: Text(
                'Watch Add',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          barrierDismissible: true,
        );
      },
      child: Container(
        padding: EdgeInsets.all(6),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: ThemeData().scaffoldBackgroundColor,
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 2,
                spreadRadius: 1,
              ),
            ]
        ),
        child: Icon(
          Icons.search_outlined,
          color: Colors.black,
        ),
      ),
    );
  }
}
