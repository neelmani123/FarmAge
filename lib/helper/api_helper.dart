import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'setup.dart';
import 'dart:convert';


class ApiBaseHelper{

  Future<dynamic> post(String url,Map reqBody) async {
    var responseJson;
    debugPrint("content ==>"+aPPmAINuRL+ url);
    final response = await http.post(aPPmAINuRL+ url ,body: jsonEncode(reqBody),headers: {HttpHeaders.contentTypeHeader: 'application/json'});
    print("content ==>"+response.body);
    responseJson = _returnResponse(response);
    return  responseJson;
  }

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body);
        return responseJson;
      case 401:
        return null;
      default:
        return null;
    }
  }

}