import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../Repository/Api/HRM_Api/hrm_api.dart';
import '../../Utils/toastmessage.dart';

part 'check_out_event.dart';
part 'check_out_state.dart';

class CheckOutBloc extends Bloc<CheckOutEvent, CheckOutState> {

  HrmApi hrmApi=HrmApi();
  CheckOutBloc() : super(CheckOutInitial()) {
    on<FetchCheckOut>((event, emit) async{
      // TODO: implement event handler
      emit(CheckOutloading());
      try {

        emit(CheckOutloaded());

      } catch (e) {
        print(e.toString());
        ToastMessage().toastmessage(message: e.toString());
        emit(CheckOutError());
      }
    });
  }
}
