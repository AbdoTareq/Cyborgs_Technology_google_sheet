import 'package:flutter/material.dart';
import 'package:flutter_template/controller/g_sheet_controller.dart';
import 'package:flutter_template/view/pages/form_list.dart';
import 'package:flutter_template/view/widgets/text_input.dart';
import '../../export.dart';
import 'package:get/get.dart';

class FormSubmitPage extends GetView<GSheetController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text('Google Sheet'),
      ),
      body: Container(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: controller.formKey,
            child: ListView(
              shrinkWrap: true,
              children: [
                TextInput(
                  tEController: controller.nameTextController,
                  hint: 'name',
                  validateMessage: 'empty',
                ),
                TextInput(
                  tEController: controller.mailTextController,
                  hint: 'mail',
                  validateMessage: 'empty',
                ),
                TextInput(
                  tEController: controller.mobileTextController,
                  hint: 'mobile',
                  validateMessage: 'empty',
                  inputType: TextInputType.number,
                ),
                TextInput(
                  tEController: controller.modelNumTextController,
                  hint: 'model number',
                  validateMessage: 'empty',
                  inputType: TextInputType.number,
                ),
                CalendarDatePicker(
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now().subtract(Duration(days: 5000)),
                    lastDate: DateTime.now(),
                    onDateChanged: (DateTime newDate) {
                      controller.purchaseDate = newDate.toString();
                      logger.i("${controller.purchaseDate}");
                    }),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RaisedButton(
                        child: 'submit'.tr.text.make(), onPressed: controller.submitSheetInfo),
                    RaisedButton(
                        child: 'Form List screen'.tr.text.make(),
                        onPressed: () => Get.to(FormListPage())),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
