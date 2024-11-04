part of 'over_time_check_out_bloc.dart';

@immutable
sealed class OverTimeCheckOutEvent {}
class FetchOverTimeCheckOut extends OverTimeCheckOutEvent {
  final String qr;
  final String attendenceId;
  FetchOverTimeCheckOut({required this.qr,required this.attendenceId});
}