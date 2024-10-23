import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pr_2/Bloc/Report/report_bloc.dart';
import 'package:pr_2/Repository/Model/Report_model.dart';

class AttendenceDetails extends StatefulWidget {
  const AttendenceDetails({super.key});

  @override
  State<AttendenceDetails> createState() => _AttendenceDetailsState();
}

class _AttendenceDetailsState extends State<AttendenceDetails> {
  late ReportModel report;
  @override
  void initState() {
    BlocProvider.of<ReportBloc>(context).add(FetchReportEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFFFE7D9),
        appBar: AppBar(
          backgroundColor: Color(0xFFFF6000),
          centerTitle: true,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              BootstrapIcons.arrow_left,
              color: Colors.white,
            ),
          ),
          title: Text(
            'Attendence Report',
            style: GoogleFonts.inter(
              color: Colors.white,
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: BlocBuilder<ReportBloc, ReportState>(
            builder: (context, state) {
              if (state is ReportblocLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is ReportblocError) {
                return RefreshIndicator(
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * .9,
                      child: Center(child: Text('Oops something went wrong')),
                    ),
                  ),
                  onRefresh: () async {
                    return BlocProvider.of<ReportBloc>(context)
                        .add(FetchReportEvent());
                  },
                );
              }
              if (state is ReportblocLoaded) {
                report = BlocProvider.of<ReportBloc>(context).reportModel;
                return Column(
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Card(
                        child: Container(
                          height: 352.h,
                          width: double.infinity.w,
                          child: Column(
                            children: [
                              Container(
                                height: 50.h,
                                width: double.infinity.w,
                                child: ListTile(
                                  leading: CircleAvatar(
                                    radius: 10.r,
                                    backgroundColor: Colors.blue,
                                  ),
                                  title: Text(
                                    'Working Days',
                                    style: GoogleFonts.inter(
                                      color: Colors.black,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  trailing: Text(
                                    '${report.summary!.workingDays.toString()} days',
                                    style: GoogleFonts.inter(
                                      color: Colors.black,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Divider(
                                color: Colors.grey,
                              ),
                              Container(
                                height: 50.h,
                                width: double.infinity.w,
                                child: ListTile(
                                  leading: CircleAvatar(
                                    radius: 10.r,
                                    backgroundColor: Colors.green,
                                  ),
                                  title: Text(
                                    'On Time',
                                    style: GoogleFonts.inter(
                                      color: Colors.black,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  trailing: Text(
                                    '${report.summary!.onTime.toString()} days',
                                    style: GoogleFonts.inter(
                                      color: Colors.black,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Divider(
                                color: Colors.grey,
                              ),
                              Container(
                                height: 50.h,
                                width: double.infinity.w,
                                child: ListTile(
                                  leading: CircleAvatar(
                                    radius: 10.r,
                                    backgroundColor: Colors.red,
                                  ),
                                  title: Text(
                                    'Late',
                                    style: GoogleFonts.inter(
                                      color: Colors.black,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  trailing: Text(
                                    '${report.summary!.late.toString()} days',
                                    style: GoogleFonts.inter(
                                      color: Colors.black,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Divider(
                                color: Colors.grey,
                              ),
                              Container(
                                height: 50.h,
                                width: double.infinity.w,
                                child: ListTile(
                                  leading: CircleAvatar(
                                    radius: 10.r,
                                    backgroundColor: Colors.grey,
                                  ),
                                  title: Text(
                                    '${report.summary!.onLeave.toString()} days',
                                    style: GoogleFonts.inter(
                                      color: Colors.black,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  trailing: Text(
                                    '0 days',
                                    style: GoogleFonts.inter(
                                      color: Colors.black,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Divider(
                                color: Colors.grey,
                              ),
                              Container(
                                height: 50.h,
                                width: double.infinity.w,
                                child: ListTile(
                                  leading: CircleAvatar(
                                    radius: 10.r,
                                    backgroundColor: Colors.black,
                                  ),
                                  title: Text(
                                    'Absent',
                                    style: GoogleFonts.inter(
                                      color: Colors.black,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  trailing: Text(
                                    '${report.summary!.absent.toString()} days',
                                    style: GoogleFonts.inter(
                                      color: Colors.black,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: Table(
                        border: TableBorder.all(color: Colors.grey),
                        defaultVerticalAlignment:
                            TableCellVerticalAlignment.middle,
                        children: [
                          TableRow(
                              decoration:
                                  BoxDecoration(color: Color(0xFFFF6000)),
                              children: [
                                TableCell(
                                  child: Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Text(
                                      'Date',
                                      style: GoogleFonts.inter(
                                          color: Colors.white,
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.w500,
                                          height: 0.10),
                                    ),
                                  ),
                                  verticalAlignment:
                                      TableCellVerticalAlignment.middle,
                                ),
                                TableCell(
                                  child: Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Text(
                                      'Checkin Time',
                                      style: GoogleFonts.inter(
                                        color: Colors.white,
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  verticalAlignment:
                                      TableCellVerticalAlignment.middle,
                                ),
                                TableCell(
                                  child: Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Text(
                                      'Checkout Time',
                                      style: GoogleFonts.inter(
                                        color: Colors.white,
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  verticalAlignment:
                                      TableCellVerticalAlignment.middle,
                                ),
                                TableCell(
                                  child: Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Text(
                                      'Working Hr\'s',
                                      style: GoogleFonts.inter(
                                        color: Colors.white,
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  verticalAlignment:
                                      TableCellVerticalAlignment.middle,
                                )
                              ]),
                          ...List.generate(
                            report.dailyReport!.length,
                            (index) {
                              return TableRow(
                                  decoration:
                                      BoxDecoration(color: Colors.white),
                                  children: [
                                    TableCell(
                                      child: Padding(
                                        padding: EdgeInsets.all(8),
                                        child: Text(report.dailyReport![index].date.toString()),
                                      ),
                                      verticalAlignment:
                                          TableCellVerticalAlignment.middle,
                                    ),
                                    TableCell(
                                      child: Padding(
                                        padding: EdgeInsets.all(8),
                                        child: Text('09:21:12'),
                                      ),
                                      verticalAlignment:
                                          TableCellVerticalAlignment.middle,
                                    ),
                                    TableCell(
                                      child: Padding(
                                        padding: EdgeInsets.all(8),
                                        child: Text('05:41:12'),
                                      ),
                                      verticalAlignment:
                                          TableCellVerticalAlignment.middle,
                                    ),
                                    TableCell(
                                      child: Padding(
                                        padding: EdgeInsets.all(8),
                                        child: Text('9 hr\'s'),
                                      ),
                                      verticalAlignment:
                                          TableCellVerticalAlignment.middle,
                                    )
                                  ]);
                            },
                          )
                        ],
                      ),
                    )
                  ],
                );
              } else {
                return SizedBox();
              }
            },
          ),
        ));
  }
}
