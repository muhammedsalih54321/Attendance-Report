part of 'report_bloc.dart';

@immutable
sealed class ReportEvent {}
class FetchReportEvent extends ReportEvent{}
