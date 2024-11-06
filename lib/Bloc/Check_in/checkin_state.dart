part of 'checkin_bloc.dart';

@immutable
sealed class CheckinState {}

final class CheckinInitial extends CheckinState {}
class Checkinloading extends CheckinState{}
class Checkinloaded extends CheckinState{}
class CheckincError extends CheckinState{}
