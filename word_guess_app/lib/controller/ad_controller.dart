import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../constants/ad_helper.dart';

class AdsController extends GetxController{
  late BannerAd bannerAd;
  var isBannerAdReady = false.obs;

  late RewardedAd rewardedAd;
  var isRewardedAdReady = false.obs;

  void loadBannerAd(){
    bannerAd = BannerAd(
      size: AdSize.banner,
      adUnitId: AdHelper.bannerAdUnitId,
      listener: BannerAdListener(
        onAdLoaded: (_){
          print('ad loaded');
          isBannerAdReady.value = true;
        },
        onAdFailedToLoad: (ad, err){
          print('Failed to load a banner ad: ${err.message}');
          isBannerAdReady.value = false;
          ad.dispose();
        }
      ),
      request: AdRequest(),);
    bannerAd.load();
  }

  void loadRewardedAd(){
    RewardedAd.load(
      adUnitId: AdHelper.rewardedAdUnitId,
      request: AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad){
          rewardedAd = ad;

          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad){
              isRewardedAdReady.value = false;
              loadRewardedAd();
            }
          );
          isRewardedAdReady.value = true;
        },
        onAdFailedToLoad: (err){
          print('Failed to load a rewarded ad: ${err.message}');
          isRewardedAdReady.value = false;
        },
      ),);
  }
}