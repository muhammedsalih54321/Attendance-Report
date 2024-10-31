part of 'check_out_bloc.dart';

@immutable
sealed class CheckOutEvent {}
class FetchCheckOut extends CheckOutEvent {
  final String qr;
  final String attendenceId;
  FetchCheckOut({required this.qr,required this.attendenceId});
}
