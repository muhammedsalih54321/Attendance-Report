part of 'check_in_bloc.dart';

@immutable
sealed class CheckInEvent {}
class FetchCheckIn extends CheckInEvent{
  final String qr;
  final BuildContext ctx;
  FetchCheckIn({required this.qr,required this.ctx});
}