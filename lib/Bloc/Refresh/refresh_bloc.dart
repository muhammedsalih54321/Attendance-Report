import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:pr_2/Repository/Api/HRM_Api/hrm_api.dart';
import 'package:pr_2/Repository/Model/Refresh_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'refresh_event.dart';
part 'refresh_state.dart';

class RefreshBloc extends Bloc<RefreshEvent, RefreshState> {
  HrmApi hrmApi = HrmApi();
  late RefreshModel refreshModel;
  RefreshBloc() : super(RefreshInitial()) {
    on<FetchlRefreshEvent>((event, emit) async {
      emit(RefreshLoading());
      try {
        refreshModel = await hrmApi.getRefresh(event.refresh,event.ctx);
        emit(RefreshLoaded());
       
        token(refreshModel.access.toString(), refreshModel.refresh.toString());
      } catch (e) {
        emit(RefreshError());
      }
    });
  }
}
  void token(String token,String refresh) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('Token', token);
    prefs.setString('Refresh', refresh);

  }