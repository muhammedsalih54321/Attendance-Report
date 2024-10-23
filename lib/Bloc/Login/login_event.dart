part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}
class FetchloginEvent extends LoginEvent{
  final String email;
  final String password;

  FetchloginEvent({required this.email, required this.password});
}
