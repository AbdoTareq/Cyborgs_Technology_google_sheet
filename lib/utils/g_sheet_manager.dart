import 'package:flutter_template/models/record.dart';
import 'package:gsheets/gsheets.dart';

import '../export.dart';

class GSheetManager {
  GSheetManager._privateConstructor();

  static final GSheetManager _instance = GSheetManager._privateConstructor();

  factory GSheetManager() {
    return _instance;
  }

  final GSheets _gsheets = GSheets(credentials);
  Spreadsheet _spreadsheet;
  Worksheet _recordSheet;

  Future<void> init() async {
    _spreadsheet ??= await _gsheets.spreadsheet(spreadsheetId);
    try {
      _recordSheet ??= await _spreadsheet.addWorksheet(sheetName);
    } on Exception catch (e) {
       logger.i("$e");
      _recordSheet ??= _spreadsheet.worksheetByTitle(sheetName);
    }
  }

  Future<List<Record>> getAll() async {
    await init();
    final records = await _recordSheet.values.map.allRows() ?? [];
    return records.map((json) => Record.fromGsheets(json)).toList();
  }

  Future<bool> insert(Record record) async {
    await init();
    return _recordSheet.values.map.insertRowByKey(
      record.id,
      record.toGsheets(),
      appendMissing: true,
    );
  }

  Future<bool> deleteById(int id) async {
    await init();
    final index = await _recordSheet.values.rowIndexOf(id);
    if (index > 0) {
      return _recordSheet.deleteRow(index);
    }
    return false;
  }

  Future<bool> delete(Record record) => deleteById(record.id);
}
