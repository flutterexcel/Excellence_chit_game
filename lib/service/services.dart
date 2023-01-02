import 'dart:convert';

import 'package:http/http.dart' as http;

import 'model.dart';

class RemoteService {
  Future<dynamic> getPosts() async {
    var client = http.Client();

    var uri = Uri.parse('https://api.razorpay.com/v1/orders');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      // ignore: avoid_print
      print("object${response.body}");
      var json = response.body;
      return OrderModel.fromJson(jsonDecode(json));
    } else {
      return null;
    }
  }
}
