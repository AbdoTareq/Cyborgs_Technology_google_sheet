import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_template/utils/my_translation.dart';
import 'package:flutter_template/view/HomePage.dart';
import 'package:flutter_template/view/animated_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app_bindings.dart';
import 'constants.dart';

Future<void> main() async {
  await GetStorage.init();
  await FirebaseAdMob.instance.initialize(appId: 'ca-app-pub-3940256099942544~3347511713');

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: kPrimaryColor // status bar color
      ));
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  final bool language = GetStorage().read('language') ?? true;
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // this for alice debugging network calls
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      // locale: egyptianArabic,
      translations: MyTranslation(),
      locale: !language ? Locale('en', 'US') : Locale('ar', 'EG'),
      // defaultTransition: Transition.leftToRight,
      initialBinding: AppBinding(),
      home: AnimatedSplash(
        imagePath: 'assets/images/logo.png',
        title: 'Digital clinic',
        home: HomePage(),
        duration: 2500,
        type: AnimatedSplashType.StaticDuration,
      ),
    );
  }
}
