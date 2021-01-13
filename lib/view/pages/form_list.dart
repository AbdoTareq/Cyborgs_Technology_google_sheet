import 'package:flutter/material.dart';
import 'package:flutter_template/controller/g_sheet_controller.dart';
import 'package:flutter_template/export.dart';
import 'package:get/get.dart';

class FormListPage extends GetView<GSheetController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('FormListPage')),
        drawer: AppDrawer(),
        body: GetX<GSheetController>(builder: (_) {
          return controller.records.isEmpty
              ? Center(child: CircularProgressIndicator())
              : ListView.separated(
                  separatorBuilder: (context, index) => Divider(
                        height: 1,
                      ),
                  itemCount: controller.records.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ListTile(
                          onTap: () {},
                          title: controller.records[index].id.text.make(),
                        ),
                        ListTile(
                          onTap: () {},
                          title: controller.records[index].name.text.make(),
                        ),
                        ListTile(
                          onTap: () {},
                          title: controller.records[index].mail.text.make(),
                        ),
                        ListTile(
                          onTap: () {},
                          title: controller.records[index].mobile.text.make(),
                        ),
                        ListTile(
                          onTap: () {},
                          title: controller.records[index].modelNum.text.make(),
                        ),
                        ListTile(
                          onTap: () {},
                          title: googleSheetsDateBaseNumber
                              .add(Duration(
                                  days: int.tryParse(controller.records[index].purchaseDate)))
                              .toString()
                              .text
                              .make(),
                        ),
                        RaisedButton(
                            child: 'delete record'.tr.text.make(),
                            onPressed: () {
                              controller.deleteRecord(index);
                            }),
                        10.heightBox
                      ],
                    ).card.make();
                  }).p8();
        }));
  }
}
