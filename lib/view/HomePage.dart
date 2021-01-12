import 'package:flutter/material.dart';
import 'package:flutter_template/controller/ads_controller.dart';
import '../export.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/HomePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text('Your Title'),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            child: Image.asset('assets/images/logo.png'),
            onTap: () {
               Get.find<AdsController>().showInterstitialAd();
            },
          ),
        ),
      ),
    );
  }
}
