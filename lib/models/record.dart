class Record {
  Record({
    this.name,
    this.mail,
    this.mobile,
    this.purchaseDate,
  });

  final String name;
  final String mail;
  final dynamic mobile;
  final String purchaseDate;

  factory Record.fromGsheets(Map<String, dynamic> json) {
    return Record(
      name: json['name'],
      mail: json['mail'],
      mobile: json['mobile'],
      purchaseDate: json['purchaseDate'],
    );
  }

  Map<String, dynamic> toGsheets() {
    return {
      'name': name,
      'mail': mail,
      'mobile': mobile,
      'purchaseDate': purchaseDate,
    };
  }

  @override
  String toString() =>
      'Record{ name: $name, mail: $mail, mobile: $mobile, purchaseDate: $purchaseDate}';
}
