import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../Repository/Api/HRM_Api/hrm_api.dart';
import '../../Repository/Model/AttendenceModel.dart';
import '../../Repository/Model/TodayAttendenceModel.dart';
import '../../Utils/toastmessage.dart';

part 'today_attendence_event.dart';
part 'today_attendence_state.dart';

class TodayAttendenceBloc extends Bloc<TodayAttendenceEvent, TodayAttendenceState> {
  late TodayAttendenceModel todayAttendenceModel;
  HrmApi hrmApi=HrmApi();
  TodayAttendenceBloc() : super(TodayAttendenceInitial()) {
    on<FetchTodayAttendence>((event, emit)async {
      emit(TodayAttendenceblocLoading());
      try {
        todayAttendenceModel= await hrmApi.getTodayAttendence();
        emit(TodayAttendenceblocLoaded());
      } catch (e) {
        ToastMessage().toastmessage(message: e.toString());
        emit(TodayAttendenceblocError());
      }
    });
  }
}
