import 'dart:convert';

import 'package:flutter_aplikasi/model.dart';
import 'package:http/http.dart';

import 'package:http/http.dart' as http;

// api provider
class Apiprovider {
  Future<List<User>> getallData() async {
    var response = await http.get(
      Uri.parse('https://6283762138279cef71d77f41.mockapi.io/api/v1/data2'),
    );
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => User.fromJson(data)).toList();
    } else {
      throw Exception("failed to load data");
    }
  }

  Future postData(
    String pnama,
    String pavatar,
    String palamat,
    String pemail,
    String ppekerjaan,
    String pquote,
  ) async {
    final Response = await http.post(
        Uri.parse("https://6283762138279cef71d77f41.mockapi.io/api/v1/data2"),
        body: {
          "nama": pnama,
          "avatar": pavatar,
          "email": pemail,
          "pekerjaan": ppekerjaan,
          "quote": pquote,
        });
    if (Response.statusCode == 201) {
      return true;
    } else {
      throw Exception("failed to push code");
    }
  }
}
