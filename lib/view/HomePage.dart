import 'package:flutter/material.dart';
import 'package:flutter_template/controller/g_sheet_controller.dart';
import 'package:flutter_template/view/widgets/text_input.dart';
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
            child: Stack(
              children: [
                ListView(
                  children: [
                    TextInput(
                      tEController: controller.nameTextController,
                      hint: 'name',
                    ),
                    TextInput(
                      tEController: controller.nameTextController,
                      hint: 'mail',
                    ),
                    TextInput(
                      tEController: controller.nameTextController,
                      hint: 'mobile',
                      inputType: TextInputType.number,
                    ),
                    TextInput(
                      tEController: controller.nameTextController,
                      hint: 'model number',
                      inputType: TextInputType.number,
                    ),
                    CalendarDatePicker(
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now().subtract(Duration(days: 5000)),
                        lastDate: DateTime.now(),
                        onDateChanged: (DateTime newDate) {
                          controller.purchaseDate = newDate;
                          logger.i("${controller.purchaseDate}");
                        })
                  ],
                ),
                Positioned(
                    bottom: 0,
                    right: 0,
                    child: RaisedButton(child: 'submit'.tr.text.make(), onPressed: () {}))
              ],
            )),
      ),
    );
  }
}
