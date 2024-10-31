part of 'check_in_bloc.dart';

@immutable
sealed class CheckInState {}

final class CheckInInitial extends CheckInState {}
class CheckInloading extends CheckInState{}
class CheckInloaded extends CheckInState{}
class CheckInError extends CheckInState{}