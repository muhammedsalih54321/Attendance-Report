import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pr_2/Bloc/Refresh/refresh_bloc.dart';
import 'package:pr_2/Repository/Api/HRM_Api/hrm_api.dart';
import 'package:pr_2/Repository/Model/Report_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'report_event.dart';
part 'report_state.dart';

class ReportBloc extends Bloc<ReportEvent, ReportState> {
  late ReportModel reportModel;
  HrmApi hrmApi=HrmApi();
  ReportBloc() : super(ReportInitial()) {
    on<FetchReportEvent>((event, emit)async {
       final SharedPreferences prefs = await SharedPreferences.getInstance();
    String refresh = prefs.getString("Refresh") ?? "";
      emit(ReportblocLoading());
      try {
        reportModel= await hrmApi.getReport(event.month,event.Year);
        emit(ReportblocLoaded());
      } catch (e) {
        if(e.toString()=='Unauthorized'){
            BlocProvider.of<RefreshBloc>(event.ctx)
          .add(FetchlRefreshEvent(refresh: refresh, ctx: event.ctx));
        }
        emit(ReportblocError());
      }
      
    });
  }
}
