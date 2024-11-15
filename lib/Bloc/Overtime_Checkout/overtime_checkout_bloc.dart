import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'overtime_checkout_event.dart';
part 'overtime_checkout_state.dart';

class OvertimeCheckoutBloc
    extends Bloc<OvertimeCheckoutEvent, OvertimeCheckoutState> {
  OvertimeCheckoutBloc() : super(OvertimeCheckoutInitial()) {
    on<OvertimeCheckoutEvent>((event, emit) {
      emit(OvertimeCheckoutloading());
      try {
        emit(OvertimeCheckoutloaded());
      } catch (e) {
        emit(OvertimeCheckoutError());
      }
    });
  }
}
