import 'package:flutter/material.dart';
import 'package:flutter_template/utils/g_sheet_manager.dart';
import 'package:get/get.dart';
import 'package:flutter_template/export.dart';

class GSheetController extends GetxController {
  TextEditingController nameTextController;
  TextEditingController mailTextController;
  TextEditingController mobileTextController;
  TextEditingController modelNumTextController;

  GSheetManager gSheetManager = GSheetManager();
  final GlobalKey<FormState> formKey = GlobalKey();

  final _purchaseDate = DateTime.now().toString().obs;
  get purchaseDate => this._purchaseDate.value;
  set purchaseDate(value) => this._purchaseDate.value = value;

  RxList<Record> _records = List<Record>().obs;
  List<Record> get records => this._records.value;
  set records(List<Record> value) => this._records.value = value;

  @override
  void onInit() async {
    super.onInit();
    nameTextController = TextEditingController();
    mailTextController = TextEditingController();
    mobileTextController = TextEditingController();
    modelNumTextController = TextEditingController();
    records = await gSheetManager.getAll();
  }

  clear() {
    nameTextController.clear();
    mailTextController.clear();
    mobileTextController.clear();
    modelNumTextController.clear();
    purchaseDate = DateTime.now().toString();
  }

  Future<void> submitSheetInfo() async {
    if (formKey.currentState.validate()) {
      Get.dialog(Center(child: CircularProgressIndicator()), barrierDismissible: false);
      final record = Record(
        id: _records.length + 2,
        name: nameTextController.text,
        mail: mailTextController.text,
        mobile: mobileTextController.text,
        modelNum: modelNumTextController.text,
        purchaseDate: purchaseDate,
      );
      logger.i("$record");
      logger.i("${nameTextController.text}");
      if (await gSheetManager.insert(record)) {
        if (Get.isDialogOpen) {
          Get.back();
        }
        clear();
        records = await gSheetManager.getAll();
        showSimpleDialog(title: 'Sucess', text: 'row inserted');
      }
    }
  }

  Future<void> deleteRecord(int index) async {
    Get.dialog(Center(child: CircularProgressIndicator()), barrierDismissible: false);

    if (await gSheetManager.deleteById(records[index].id)) {
      records.removeAt(index);
      if (Get.isDialogOpen) {
        Get.back();
      }
      records = await gSheetManager.getAll();
      showSimpleDialog(title: 'Sucess', text: 'row deleted');
    }
  }

  @override
  void onClose() {
    super.onClose();
    nameTextController?.dispose();
    mailTextController?.dispose();
    mobileTextController?.dispose();
    modelNumTextController?.dispose();
  }
}
