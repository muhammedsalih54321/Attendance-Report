import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../Repository/Api/HRM_Api/hrm_api.dart';
import '../../Repository/Model/CheckInModel.dart';
import '../../Utils/toastmessage.dart';

part 'over_time_check_out_event.dart';
part 'over_time_check_out_state.dart';

class OverTimeCheckOutBloc extends Bloc<OverTimeCheckOutEvent, OverTimeCheckOutState> {
  HrmApi hrmApi=HrmApi();
  late CheckInModel checkInModel;
  OverTimeCheckOutBloc() : super(OverTimeCheckOutInitial()) {
    on<FetchOverTimeCheckOut>((event, emit)async {
      emit(OverTimeCheckOutloading());
      try {
        checkInModel= await hrmApi.overTimeCheckOut(event.qr, event.attendenceId);
        emit(OverTimeCheckOutloaded());

      } catch (e) {
        print(e.toString());
        ToastMessage().toastmessage(message: e.toString());
        emit(OverTimeCheckOutError());
      }
    });
  }
}
