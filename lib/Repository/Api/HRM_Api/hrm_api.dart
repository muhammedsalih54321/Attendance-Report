import 'dart:convert';

import 'package:http/http.dart';
import 'package:pr_2/Repository/Api/api_client.dart';
import 'package:pr_2/Repository/Model/Login_model.dart';
import 'package:pr_2/Repository/Model/Report_model.dart';
import 'package:pr_2/main.dart';

import '../../Model/CheckInModel.dart';

class HrmApi {
  ApiClient apiClient = ApiClient();

//1
  Future<LoginModel> getLogin(String email, String password) async {
    String trendingpath = '/auth/local/login';

    print(trendingpath);
    var body = {"email": email, "password": password};
    print(body);
    Response response =
        await apiClient.invokeAPI(trendingpath, 'LOGINPOST', jsonEncode(body));

    print(response.body);
    return LoginModel.fromJson(jsonDecode(response.body));
  }

  //2
  Future<ReportModel> getReport(String month, String year) async {
    String trendingpath = '/api/attendances/report?month=$month&year=$year';
    var body = {};
    Response response = await apiClient.invokeAPI(trendingpath, 'GET', body);

    return ReportModel.fromJson(jsonDecode(response.body));
  }

  //check in api
  Future<CheckInModel> checkIn(String qr) async {
    String trendingpath = '/api/attendances/check-in/$qr';

    print(trendingpath);
    var body = {};
    Response response = await apiClient.invokeAPI(trendingpath, 'POST', body);

    return CheckInModel.fromJson(jsonDecode(response.body));
  }

  //checkout api
  Future<CheckInModel> checkOut(String qr, String attendenceId) async {
    String trendingpath = '/api/attendances/check-out/$attendenceId/$qr';

    print(trendingpath);
    var body = {};
    Response response =   await apiClient.invokeAPI(trendingpath, 'POST', body);
    return CheckInModel.fromJson(jsonDecode(response.body));
  }
  //overTime CheckIn
  Future<CheckInModel> overTimeCheckIn(String qr, String attendenceId) async {
    String trendingpath = '/api/attendances/overtime-check-in/$attendenceId/$qr';

    print(trendingpath);
    var body = {};
    Response response =  await apiClient.invokeAPI(trendingpath, 'POST', body);
    return CheckInModel.fromJson(jsonDecode(response.body));
  }
  //overTime CheckOut
  Future<CheckInModel> overTimeCheckOut(String qr, String attendenceId) async {
    String trendingpath = '/api/attendances/overtime-check-out/$attendenceId/$qr';

    print(trendingpath);
    var body = {};
    Response response =  await apiClient.invokeAPI(trendingpath, 'POST', body);
    return CheckInModel.fromJson(jsonDecode(response.body));
  }
}
