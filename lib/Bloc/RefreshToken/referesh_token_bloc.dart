import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:pr_2/Repository/Model/RefereshTokenModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Repository/Api/HRM_Api/hrm_api.dart';
import '../../Utils/toastmessage.dart';

part 'referesh_token_event.dart';
part 'referesh_token_state.dart';

class RefereshTokenBloc extends Bloc<RefereshTokenEvent, RefereshTokenState> {
  HrmApi hrmApi=HrmApi();
  late RefereshTokenModel refereshTokenModel;
  RefereshTokenBloc() : super(RefereshTokenInitial()) {
    on<FetchRefreshToken>((event, emit)async {
      emit(RefereshTokenloading());
      try {
        refereshTokenModel= await hrmApi.refreshToken(event.refershToken,event.ctx);
        token(refereshTokenModel.access.toString(),refereshTokenModel.refresh.toString());
        emit(RefereshTokenloaded());

      } catch (e) {
        print(e.toString());
        ToastMessage().toastmessage(message: e.toString());
        emit(RefereshTokenError());
      }
      // TODO: implement event handler
    });
  }
}
void token(String token,String refresh) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('Token', token);
  prefs.setString('Refresh', refresh);

}