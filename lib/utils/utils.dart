// methods
import 'package:flutter/material.dart';
import 'package:get/get.dart';

showSimpleDialog({String title = '', String text = ''}) {
  Get.defaultDialog(
      title: title.isNotEmpty ? title : 'watch'.tr,
      middleText: text.isNotEmpty ? text : 'under_dev'.tr,
      titleStyle: TextStyle(color: Colors.red));
}

// your google auth credentials
const credentials = r'''
{
  "type": "service_account",
  "project_id": "cyborgs-technology-g-sheet",
  "private_key_id": "ba998bd9283a16d5db506e1e85a8b56b39414681",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDinnLxsekoGOg+\nOqR5R0N6Dj5S95cjggGgLWpPVelT5SPF6keHh9UlZ8vhSgMLHw0QhxjZCqa4/0sx\nysYz1WyE02syMUloJS+xjFTm6xStVSwDgqbw9CLJKZQHSiEEHubrV80vUtBNp9Fj\nmot7PlP+gkNK6Wy5GQugSNxdqsof9KxpU5vpZFsW53Hl8v9FIJ60LNSgjoijQ7UO\nnLvgzlv9YxClMpDUxwS5j2P3yuw09pDtTlCHc/ByCqhPKGOpY3nHAPcHm3Md/n3x\nH0ShnVKKTPwEat/8oE2yhuNslncpBRZjoEZ1OHXSvjcoQsHUN33+G6TBdFUdLd4S\nf3gvxJD5AgMBAAECggEAEeZTDO0xDeY9veCS6jNrTIJAgPwmd3sG1tiPe5m9Fs/U\nDgdtw/JCLzSuIWrfp6q5tPL+zvHs7lLX5SRvmFuEuU8bufizpCK/zCXZ9O1fkjtW\ngSZ6OjEGaF4834CG8BTix3cFcXX4lxGo09W6q67mIoW2e/3JBSvJw8zNfyaE1ZYv\nTzMMbL5mc3oft7afgFRNpkW3NtsWzgcGhRPgesmCwDQ8LU1yK72MS52P6PW8g1bd\nPENbdN63dM6PeoQdAHDnerhLAwksubK2C0bYhscfNGDAfbK6ak0W7twMMCG14bs1\nNl/kxyIYbOUP+4fDEAHYbmZJSYb40ISXPipyO/otMwKBgQD5ikh/0puqBfaQONOL\nOvqpB10yso9CgCDZephQFSM8KO+RXmNIGOzd/HhKS1MTkMsAwFbeb0w4nn5rSTmQ\nnLh3+uBl0cL68bF6wxg5LTG+duxll3CJPuZKByHY6S28D0r5C8LTgTEp6QPMemjL\nkUPrzRLNvcNymqnQD9QJSvtBMwKBgQDofEP52iljzMoM4fKpbYlKI6GwsDBmGood\nqzETUFR6hLT0rd3GiUY7WlyhuKbBRTlbc3vZPqWQI128vCrWFpaWGsVQCb91FqSb\n0ivyhhFsliLzCAGUCcl7YEZNiiolVMVeRcjFBXFS1ksTledJCN85Qrp4aun2fWbp\nzBZoXpi9IwKBgD1qvYFIUqu8H/1LHzXLZFopx9Rsgjn50xvzwn0jVrK92IjM1F6w\nU8wnEWwnseDE6FHdBQRmHDprN+4r7ZEcIYLWKlilEfo1dlsinVmlN/MKzhAK/9Wn\nt4JM0xXR/kGk+ezl6iOoTnNkOF0hW52OuUrWBGTC6dHRIy5kVumanNBlAoGAT5/v\n8C0GLAZB1XO1ls3LTbcyc7+EdBP25f5yCnli1auKBptd79eoVD+4pjMF+f/piybc\nbiWEsv9J5ZBU44pM/RAiMC2Gg2XD7xJmtuOwKA6r3a0KTVekyDrLGVeO48ZK6uTf\nxIr+qy51/DlFQ8BkI8p07zU++IsuqjiaHBj6Gx0CgYEA0HSP4HKO/6WRUuxlr14m\nxB1M+x2H2XYACaGX6c2rmbAHYUBa2eW8siedd56hFsKEjw4VJ67qYOBa77dO/aSw\n+0IFFkynbJC2eI8D6wTA00vJ7FD4vukcz5JGvWWNVEf1/fNwhMqOhvhGShS2LwCc\n6+LNbCudi6g/q/MxPU5ndBI=\n-----END PRIVATE KEY-----\n",
  "client_email": "gsheets@cyborgs-technology-g-sheet.iam.gserviceaccount.com",
  "client_id": "109273033720063515785",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/gsheets%40cyborgs-technology-g-sheet.iam.gserviceaccount.com"
}
''';

// your spreadsheet id that exists in url
const spreadsheetId = '1xgMxE0fkLKVqXC3nSj5QtuJXAMjSlljIHibyrDjsDKE';
