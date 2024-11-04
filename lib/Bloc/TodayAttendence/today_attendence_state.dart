part of 'today_attendence_bloc.dart';

@immutable
sealed class TodayAttendenceState {}

final class TodayAttendenceInitial extends TodayAttendenceState {}
class TodayAttendenceblocLoading extends TodayAttendenceState{}
class TodayAttendenceblocLoaded extends TodayAttendenceState{}
class TodayAttendenceblocError extends TodayAttendenceState{}