import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pr_2/Repository/Api/HRM_Api/hrm_api.dart';
import 'package:pr_2/Repository/Model/check_in_model.dart';

part 'checkin_event.dart';
part 'checkin_state.dart';

class CheckinBloc extends Bloc<CheckinEvent, CheckinState> {
  late CheckinModel checkinModel;
  HrmApi hrmApi=HrmApi();
  CheckinBloc() : super(CheckinInitial()) {
    on<CheckinEvent>((event, emit) async {
      emit(Checkinloading());
      try {
        checkinModel=await hrmApi.getCheckin();
        emit(Checkinloaded());
      } catch (e) {
        emit(CheckincError());
      }

    });
  }
}
