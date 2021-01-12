import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

// it must not be empty string so it has space
const String testDevice = ' ';

class AdsController extends GetxController {
  static const MobileAdTargetingInfo _targetingInfo = MobileAdTargetingInfo(
    testDevices: testDevice != null ? <String>[testDevice] : null,
    keywords: <String>['Game', 'Mario'],
  );

  InterstitialAd _interstitialAd;
  @override
  void onInit() {
    super.onInit();
    _interstitialAd = _createInterstitialAd();
    _interstitialAd.load();
  }

  showInterstitialAd() {
    // if in debug mode don't show ads for faster development
    if (kDebugMode) {
      _interstitialAd.show();
      _interstitialAd = _createInterstitialAd();
      _interstitialAd.load();
    }
  }

  InterstitialAd _createInterstitialAd() {
    return InterstitialAd(
        adUnitId: 'ca-app-pub-3940256099942544/1033173712',
        //Change Interstitial AdUnitId with Admob ID
        targetingInfo: _targetingInfo,
        listener: (MobileAdEvent event) {
          if (kDebugMode) print("IntersttialAd error: $event");
        });
  }
}
