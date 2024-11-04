import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../Repository/Api/HRM_Api/hrm_api.dart';
import '../../Repository/Model/CheckInModel.dart';
import '../../Utils/toastmessage.dart';

part 'over_time_check_in_event.dart';
part 'over_time_check_in_state.dart';

class OverTimeCheckInBloc extends Bloc<OverTimeCheckInEvent, OverTimeCheckInState> {
  late CheckInModel checkInModel;
  HrmApi hrmApi=HrmApi();
  OverTimeCheckInBloc() : super(OverTimeCheckInInitial()) {
    on<FetchOverTimeCheckIn>((event, emit) async{
      emit(OverTimeCheckInloading());
      try {
        checkInModel= await hrmApi.overTimeCheckIn(event.qr, event.attendenceId);
        emit(OverTimeCheckInloaded());

      } catch (e) {
        print(e.toString());
        ToastMessage().toastmessage(message: e.toString());
        emit(OverTimeCheckInError());
      }
    });
  }
}
