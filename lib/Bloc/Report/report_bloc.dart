import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pr_2/Repository/Api/HRM_Api/hrm_api.dart';
import 'package:pr_2/Repository/Model/Report_model.dart';

import '../../Utils/toastmessage.dart';

part 'report_event.dart';
part 'report_state.dart';

class ReportBloc extends Bloc<ReportEvent, ReportState> {
  late ReportModel reportModel;
  HrmApi hrmApi=HrmApi();
  ReportBloc() : super(ReportInitial()) {
    on<FetchReportEvent>((event, emit)async {
      emit(ReportblocLoading());
      try {
        reportModel= await hrmApi.getReport(event.month,event.Year);
        emit(ReportblocLoaded());
      } catch (e) {
        ToastMessage().toastmessage(message: e.toString());
        emit(ReportblocError());
      }
      
    });
  }
}
