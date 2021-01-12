import 'package:flutter_template/utils/utils.dart';
import 'package:get/get.dart';
import 'package:gsheets/gsheets.dart';
import 'package:flutter_template/export.dart';
import '../export.dart';

class GSheetController extends GetxController {
  getSheetInfo() async {
    // init GSheets
    final gsheets = GSheets(credentials);
    // fetch spreadsheet by its id
    final ss = await gsheets.spreadsheet(spreadsheetId);
    logger.i("$ss");
    // get worksheet by its title
    final sheet = ss.worksheetByTitle('products');
    logger.i("$sheet");
  }
}
