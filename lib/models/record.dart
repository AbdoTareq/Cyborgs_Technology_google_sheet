import 'package:flutter/material.dart';

class Record {
  Record({
    @required this.id,
    this.name,
    this.mail,
    this.mobile,
    this.modelNum,
    this.purchaseDate,
  });

  final int id;
  final String name;
  final String mail;
  final String mobile;
  final String modelNum;
  final String purchaseDate;

  factory Record.fromGsheets(Map<String, dynamic> json) {
    return Record(
      id: int.tryParse(json['id'] ?? ''),
      name: json['name'],
      mail: json['mail'],
      mobile: json['mobile'],
      modelNum: json['modelNum'],
      purchaseDate: json['purchaseDate'],
    );
  }

  Map<String, dynamic> toGsheets() {
    return {
      'id': id,
      'name': name,
      'mail': mail,
      'mobile': mobile,
      'modelNum': modelNum,
      'purchaseDate': purchaseDate,
    };
  }

  @override
  String toString() =>
      'Record{id: $id, name: $name, mail: $mail, mobile: $mobile, purchaseDate: $purchaseDate}';
}
