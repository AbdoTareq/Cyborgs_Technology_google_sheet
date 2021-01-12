import 'package:gsheets/gsheets.dart';

import '../export.dart';

class GSheetManager {
  final GSheets _gsheets = GSheets(credentials);
  Spreadsheet _spreadsheet;
  Worksheet _productSheet;

  Future<void> init() async {
    _spreadsheet ??= await _gsheets.spreadsheet(spreadsheetId);
    _productSheet ??= _spreadsheet.worksheetByTitle(sheetName);
  }
}
