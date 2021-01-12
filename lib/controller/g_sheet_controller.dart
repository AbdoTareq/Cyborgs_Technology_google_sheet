import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gsheets/gsheets.dart';

import '../export.dart';

class GSheetController extends GetxController {
  TextEditingController nameTextController;
  TextEditingController mobileTextController;
  TextEditingController modelNumTextController;

  final _purchaseDate = DateTime(2021).obs;
  get purchaseDate => this._purchaseDate.value;
  set purchaseDate(value) => this._purchaseDate.value = value;

  @override
  void onInit() async {
    super.onInit();
    nameTextController = TextEditingController();
    mobileTextController = TextEditingController();
    modelNumTextController = TextEditingController();
  }

  Future<void> submitSheetInfo() async {
    
  }

  @override
  void onClose() {
    super.onClose();
    nameTextController?.dispose();
    mobileTextController?.dispose();
    modelNumTextController?.dispose();
  }
}
