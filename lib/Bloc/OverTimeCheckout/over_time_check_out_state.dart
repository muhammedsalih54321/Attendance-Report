part of 'over_time_check_out_bloc.dart';

@immutable
sealed class OverTimeCheckOutState {}

final class OverTimeCheckOutInitial extends OverTimeCheckOutState {}
class OverTimeCheckOutloading extends OverTimeCheckOutState{}
class OverTimeCheckOutloaded extends OverTimeCheckOutState{}
class OverTimeCheckOutError extends OverTimeCheckOutState{}