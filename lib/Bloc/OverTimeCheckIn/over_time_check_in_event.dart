part of 'over_time_check_in_bloc.dart';

@immutable
sealed class OverTimeCheckInEvent {}
class FetchOverTimeCheckIn extends OverTimeCheckInEvent {
  final String qr;
  final String attendenceId;
  FetchOverTimeCheckIn({required this.qr,required this.attendenceId});
}