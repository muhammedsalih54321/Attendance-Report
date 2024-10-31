part of 'check_in_bloc.dart';

@immutable
sealed class CheckInEvent {}
class FetchCheckIn extends CheckInEvent{
  final String qr;
  FetchCheckIn({required this.qr});
}