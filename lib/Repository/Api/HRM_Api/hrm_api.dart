import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:pr_2/Repository/Api/api_client.dart';
import 'package:pr_2/Repository/Model/Login_model.dart';
import 'package:pr_2/Repository/Model/Refresh_model.dart';
import 'package:pr_2/Repository/Model/Report_model.dart';
import 'package:pr_2/Repository/Model/check_in_model.dart';
import 'package:pr_2/Repository/Model/check_out_model.dart';
import 'package:pr_2/main.dart';

class HrmApi {
  ApiClient apiClient = ApiClient();
//1
  Future<LoginModel> getLogin(String email, String password) async {
    String trendingpath = '$basePath/auth/local/login';

    print(trendingpath);
    var body = {"email": email, "password": password};
    print(body);
    Response response =
        await apiClient.invokeAPI(trendingpath, 'POST', jsonEncode(body), null);

    print(response.body);
    return LoginModel.fromJson(jsonDecode(response.body));
  }

  //2
  Future<ReportModel> getReport(String month, String year) async {
    String trendingpath =
        '$basePath/api/attendances/report?month=$month&year=$year';
    var body = {};
    Response response =
        await apiClient.invokeAPI(trendingpath, 'GET', body, null);

    return ReportModel.fromJson(jsonDecode(response.body));
  }

  //3
  Future<RefreshModel> getRefresh(String refresh, BuildContext ctx) async {
    String trendingpath = '$basePath/auth/refresh';

    print(trendingpath);
    var body = {
      "refresh": refresh,
    };
    print('hello' + body.toString());
    Response response =
        await apiClient.invokeAPI(trendingpath, 'POST', jsonEncode(body), ctx);

    print(response.body);
    return RefreshModel.fromJson(jsonDecode(response.body));
  }

  //4
  Future<CheckinModel> getCheckin() async {
    String trendingpath =
        '$basePath/api/attendances/check-in/YTEzB63xo8O9zzjiHrFb';

    print(trendingpath);
    var body = {};
    print('hello' + body.toString());
    Response response =
        await apiClient.invokeAPI(trendingpath, 'POST', jsonEncode(body),null);

    print(response.body);
    return CheckinModel.fromJson(jsonDecode(response.body));
  }
   //5
  Future<CheckoutModel> getCheckout() async {
    String trendingpath =
        '$basePath/api/attendances/check-out/:attId/:qrcode';

    print(trendingpath);
    var body = {};
    print('hello' + body.toString());
    Response response =
        await apiClient.invokeAPI(trendingpath, 'POST', jsonEncode(body),null);

    print(response.body);
    return CheckoutModel.fromJson(jsonDecode(response.body));
  }
}
