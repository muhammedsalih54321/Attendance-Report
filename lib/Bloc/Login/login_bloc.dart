import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pr_2/Repository/Api/HRM_Api/hrm_api.dart';
import 'package:pr_2/Repository/Model/Login_model.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  late LoginModel loginModel;
  HrmApi hrmApi=HrmApi();
  LoginBloc() : super(LoginInitial()) {
    on<FetchloginEvent>((event, emit)async {
      emit(Loginblocloading());
      try {
        loginModel= await hrmApi.getLogin(event.email, event.password);
        emit(Loginblocloaded());
      } catch (e) {
        print(e.toString());
        emit(LoginblocError());
      }

    });
  }
}
