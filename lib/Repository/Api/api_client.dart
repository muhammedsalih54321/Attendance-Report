import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:pr_2/Repository/Api/api_exeption.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiClient {
  Future<Response> invokeAPI(
      String path, String method, Object? body, BuildContext? ctx) async {
    Map<String, String> headerParams = {};
    Response response;

    String url = path;
    print(url);
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("Token") ?? "";
  
    print(token);

    final nullableHeaderParams = (headerParams.isEmpty) ? null : headerParams;
    print(body);
    switch (method) {
      case "POST":
        response = await post(Uri.parse(url),
            headers: {
              'Content-Type': 'application/json',
              //'content-Type': 'application/x-www-form-urlencoded',
            },
            body: body);

        break;
      case "PUT":
        response = await put(Uri.parse(url),
            headers: {
              'content-Type': 'application/json',
            },
            body: body);
        break;
      case "DELETE":
        response = await delete(Uri.parse(url), headers: {}, body: body);
        break;
      case "POST_":
        response = await post(
          Uri.parse(url),
          headers: {'content-Type': 'application/json'},
          body: body,
        );
        break;
      case "GET_":
        response = await post(
          Uri.parse(url),
          headers: {},
          body: body,
        );
        break;
      case "GET":
        response = await get(
          Uri.parse(url),
          headers: {
            'Authorization': "Bearer $token",
            'Accept': 'application/json',
            'Content-Type': 'application/json'
          },
        );

        break;
      case "PATCH":
        response = await patch(
          Uri.parse(url),
          headers: {'Content-Type': 'application/json'},
          body: body,
        );
        break;
      case "PATCH1":
        response = await patch(
          Uri.parse(url),
          headers: {},
          body: body,
        );
        break;
      default:
        response = await get(Uri.parse(url), headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        });
    }

    print('status of $path =>' + (response.statusCode).toString());
    print(response.body);
    if (response.statusCode == 401) {
      print("hello");
    
    }
    if (response.statusCode >= 400) {
      log(path +
          ' : ' +
          response.statusCode.toString() +
          ' : ' +
          response.body);

      throw ApiException(_decodeBodyBytes(response), response.statusCode);
    }
    return response;
  }

  String _decodeBodyBytes(Response response) {
    var contentType = response.headers['content-type'];
    if (contentType != null && contentType.contains("application/json")) {
      return jsonDecode(response.body)['message'];
    } else {
      return response.body;
    }
  }
}
