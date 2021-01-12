import 'package:flutter/material.dart';
import 'package:flutter_template/controller/app_settings_controller.dart';
import 'package:get/get.dart';
import 'package:flutter_template/export.dart';

class AppDrawer extends GetView<AppSettingsController> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(
            () => SwitchListTile(
                title: 'darkMode'.tr.text.make(),
                value: controller.darkMode.value,
                onChanged: (_) {
                  controller.darkMode.toggle();
                  controller.box.write('dark', controller.darkMode.value);
                }),
          ),
          Obx(
            () => SwitchListTile(
                title: 'language'.tr.text.make(),
                value: controller.lang.value,
                onChanged: (_) {
                  controller.lang.toggle();
                  controller.box.write('language', controller.lang.value);
                }),
          ),
        ],
      ).centered(),
    );
  }
}
