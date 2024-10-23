part of 'report_bloc.dart';

@immutable
sealed class ReportState {}

final class ReportInitial extends ReportState {}
class ReportblocLoading extends ReportState{}
class ReportblocLoaded extends ReportState{}
class ReportblocError extends ReportState{}
