import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:pr_2/Repository/Api/HRM_Api/hrm_api.dart';
import 'package:pr_2/Repository/Model/Report_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Utils/toastmessage.dart';
import '../RefreshToken/referesh_token_bloc.dart';

part 'report_event.dart';
part 'report_state.dart';

class ReportBloc extends Bloc<ReportEvent, ReportState> {
  late ReportModel reportModel;
  HrmApi hrmApi=HrmApi();
  ReportBloc() : super(ReportInitial()) {
    on<FetchReportEvent>((event, emit)async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      String refreshToken= prefs.getString("Refresh")??"";
      emit(ReportblocLoading());
      try {
        reportModel= await hrmApi.getReport(event.month,event.Year);
        emit(ReportblocLoaded());
      } catch (e) {
        if(e.toString()=="UnAuthorized"){
          BlocProvider.of<RefereshTokenBloc>(event.ctx).add(FetchRefreshToken(refershToken: refreshToken, ctx: event.ctx));
        }
        ToastMessage().toastmessage(message: e.toString());
        emit(ReportblocError());
      }
      
    });
  }
}
