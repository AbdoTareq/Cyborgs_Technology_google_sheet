import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:faker/faker.dart';

// this for alice debugging network calls
GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final logger = Logger();
var faker = Faker();

//base url
const base_url = 'https://cairo-metro-ticket.herokuapp.com/';
const headers = {'Accept': 'application/json'};

// styles
final Color kbackgroundColor = Colors.grey[300];
const Color kPrimaryColor = Colors.green;
const TextStyle kTStyle = TextStyle(
  fontSize: 30,
  color: Colors.white,
);

// methods
showWarningDialog({String title = '', String text = ''}) {
  Get.defaultDialog(
    title: title.isNotEmpty ? title.tr : 'watch'.tr,
    middleText: text.isNotEmpty ? text.tr : 'under_dev'.tr,
    titleStyle: TextStyle(color: Colors.red),
  );
}

showOptionsDialog(
    {String title = '', String text = '', @required Function yesFunction}) {
  Get.defaultDialog(
      title: title.isNotEmpty ? title.tr : 'watch'.tr,
      middleText: text.isNotEmpty ? text.tr : 'under_dev'.tr,
      titleStyle: TextStyle(color: Colors.red),
      actions: [
        FlatButton(
          onPressed: yesFunction,
          child: Text(
            'yes'.tr,
            style: TextStyle(color: Colors.red),
          ),
        ),
        FlatButton(
          onPressed: () => Get.back(),
          child: Text(
            'cancel'.tr,
          ),
        ),
      ]);
}

showSimpleDialog({String title = '', String text = ''}) {
  Get.defaultDialog(
    title: title.isNotEmpty ? title.tr : '👍',
    middleText: text.isNotEmpty ? text.tr : 'under_dev'.tr,
  );
}
