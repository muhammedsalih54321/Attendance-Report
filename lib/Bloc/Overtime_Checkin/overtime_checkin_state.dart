part of 'overtime_checkin_bloc.dart';

@immutable
sealed class OvertimeCheckinState {}

final class OvertimeCheckinInitial extends OvertimeCheckinState {}
class OvertimeCheckinloading extends OvertimeCheckinState{}
class OvertimeCheckinloaded extends OvertimeCheckinState{}
class OvertimeCheckinError extends OvertimeCheckinState{}
