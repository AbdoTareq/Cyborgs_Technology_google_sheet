import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:alice/alice.dart';

import '../constants.dart';
import '../export.dart';

class Network {
  final String endPoint;
  final dynamic body;

  // good practice to make one connection to server available to the app as we don't want to create a new connection every time we make server call
  static var _client = http.Client();

  Network({@required this.endPoint, this.body});
  Alice _alice = Alice(showNotification: true, navigatorKey: navigatorKey);

  Future<http.Response> request(Future<http.Response> Function() requestType) async {
    try {
      final response = await requestType();
      if (kDebugMode) {
        _alice.onHttpResponse(response);
      }
      if (response.statusCode != 200) throw Failure(message: '${json.decode(response.body)['message']}');
      // success
      return response;
    } on Exception catch (e) {
      throw Failure(message: '').handleNetworkError(e);
    }
  }

  Future<http.Response> post() {
    return request(() {
      return _client.post(base_url + endPoint, body: body, headers: headers);
    });
  }

  Future<http.Response> get() {
    return request(() {
      return _client.get(base_url + endPoint, headers: headers);
    });
  }
}
