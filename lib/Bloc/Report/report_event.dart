part of 'report_bloc.dart';

@immutable
sealed class ReportEvent {}
class FetchReportEvent extends ReportEvent{
  final String month;
  final String Year;
  final BuildContext ctx;

  FetchReportEvent({required this.month, required this.Year,required this.ctx});
}
