import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pr_2/Utils/toastmessage.dart';

import '../../Repository/Api/HRM_Api/hrm_api.dart';
import '../../Repository/Model/CheckInModel.dart';

part 'check_in_event.dart';
part 'check_in_state.dart';

class CheckInBloc extends Bloc<CheckInEvent, CheckInState> {
  late CheckInModel checkInModel;
  HrmApi hrmApi=HrmApi();
  CheckInBloc() : super(CheckInInitial()) {
    on<FetchCheckIn>((event, emit) async{
      emit(CheckInloading());
      try {
        checkInModel= await hrmApi.checkIn(event.qr);
        emit(CheckInloaded());
ToastMessage().toastmessage(message: "Check In Success");
      } catch (e) {
        print(e.toString());
        ToastMessage().toastmessage(message: e.toString());
        emit(CheckInError());
      }
    });
  }
}
