import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:pr_2/Repository/Api/api_client.dart';
import 'package:pr_2/Repository/Model/Login_model.dart';
import 'package:pr_2/Repository/Model/Refresh_model.dart';
import 'package:pr_2/Repository/Model/Report_model.dart';
import 'package:pr_2/main.dart';


class HrmApi {
  ApiClient apiClient = ApiClient();
//1
  Future<LoginModel> getLogin(String email,String password ) async {
    String trendingpath = '$basePath/auth/local/login';

    print(trendingpath);
    var body ={
    "email":email,
    "password":password
};
print(body);
    Response response =
        await apiClient.invokeAPI(trendingpath, 'POST', jsonEncode(body),null);
       
print(response.body);
    return LoginModel.fromJson(jsonDecode(response.body));
  }
  //2
 Future<ReportModel> getReport(String month,String year) async {
    String trendingpath = '$basePath/api/attendances/report?month=$month&year=$year';
    var body = {

    };
    Response response = await apiClient.invokeAPI(trendingpath, 'GET', body,null);

    return ReportModel.fromJson(jsonDecode(response.body));
  }
  //3
   Future<RefreshModel> getRefresh(String refresh,BuildContext ctx) async {
    String trendingpath = '$basePath/auth/refresh';

    print(trendingpath);
    var body ={
    "refresh":refresh,

};
print('hello'+body.toString());
    Response response =
        await apiClient.invokeAPI(trendingpath, 'POST', jsonEncode(body),ctx);
       
print(response.body);
    return RefreshModel.fromJson(jsonDecode(response.body));
  }
 
}