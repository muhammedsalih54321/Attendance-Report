part of 'over_time_check_in_bloc.dart';

@immutable
sealed class OverTimeCheckInState {}

final class OverTimeCheckInInitial extends OverTimeCheckInState {}
class OverTimeCheckInloading extends OverTimeCheckInState{}
class OverTimeCheckInloaded extends OverTimeCheckInState{}
class OverTimeCheckInError extends OverTimeCheckInState{}