import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pr_2/Repository/Api/HRM_Api/hrm_api.dart';
import 'package:pr_2/Repository/Model/check_out_model.dart';

part 'checkout_event.dart';
part 'checkout_state.dart';

class CheckOutBloc extends Bloc<CheckOutEvent, CheckOutState> {
  late CheckoutModel checkoutModel;
  HrmApi hrmApi=HrmApi();
  CheckOutBloc() : super(CheckOutInitial()) {
    on<CheckOutEvent>((event, emit) async {
        emit(Checkoutloading());
      try {
        checkoutModel=await hrmApi.getCheckout();
        emit(Checkoutoaded());
      } catch (e) {
        emit(CheckoutcError());
      }

    });
  }
}
