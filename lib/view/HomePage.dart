import 'package:flutter/material.dart';
import 'package:flutter_template/controller/g_sheet_controller.dart';
import '../export.dart';
import 'package:get/get.dart';

class HomePage extends GetView<GSheetController> {
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
            onTap: () async {
              await controller.getSheetInfo();
            },
          ),
        ),
      ),
    );
  }
}
