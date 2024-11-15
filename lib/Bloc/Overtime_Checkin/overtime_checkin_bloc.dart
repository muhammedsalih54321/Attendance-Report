import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'overtime_checkin_event.dart';
part 'overtime_checkin_state.dart';

class OvertimeCheckinBloc
    extends Bloc<OvertimeCheckinEvent, OvertimeCheckinState> {
  OvertimeCheckinBloc() : super(OvertimeCheckinInitial()) {
    on<OvertimeCheckinEvent>((event, emit) {
      emit(OvertimeCheckinloading());
      try {
        emit(OvertimeCheckinloaded());
      } catch (e) {
        emit(OvertimeCheckinError());
      }
    });
  }
}
