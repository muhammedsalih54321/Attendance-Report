import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:pr_2/Bloc/Report/report_bloc.dart';
import 'package:pr_2/Repository/Model/Report_model.dart';

class AttendenceDetails extends StatefulWidget {
  // final String checkIn;
  // final String checkOut;
  const AttendenceDetails({
    super.key,
  });

  @override
  State<AttendenceDetails> createState() => _AttendenceDetailsState();
}

class _AttendenceDetailsState extends State<AttendenceDetails> {
  late ReportModel report;

  get weekdays => null;
  @override
  void initState() {
    BlocProvider.of<ReportBloc>(context).add(FetchReportEvent(
        month: _currentDate.month.toString(),
        Year: _currentDate.year.toString()));
        Dateinmonth = DateFormat('MMMM').format(DateTime.now());
        Dateinyear=DateFormat('yyyy').format(DateTime.now());
    super.initState();
  }

  String getweekday(String givenDate) {
    DateTime date = DateTime.parse(givenDate);
    int weekday = date.weekday;

    List<String> Weekdays = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday'
    ];
    int dayNumber = date.day;

    return '${Weekdays[weekday - 1]}\n   $dayNumber';
  }

  DateTime _currentDate = DateTime.now(); // Initially set to current date

  // // Function to format the current month and year
  // String getCurrentMonthYear() {
  //   return DateFormat('MMMM, yyyy').format(_currentDate);
  // }
 String Dateinmonth = '';
 String Dateinyear = '';


  Future<void> selectedate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        Dateinmonth = DateFormat('MMMM').format(picked);  
        Dateinyear=DateFormat('yyyy').format(picked);// Update date
      });
    }
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
                  return BlocProvider.of<ReportBloc>(context).add(
                      FetchReportEvent(
                          month: _currentDate.month.toString(),
                          Year: _currentDate.year.toString()));
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
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Container(
                      height: 50.h,
                      width: double.infinity.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            child: Container(),
                          ),
                          Text(
                            '$Dateinmonth,$Dateinyear',
                            style: GoogleFonts.inter(
                              color: Colors.black,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              selectedate();
                            },
                            child: Icon(
                              Icons.calendar_month,
                              color: Color(0xFFFF6000),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
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
                                  'On Leave',
                                  style: GoogleFonts.inter(
                                    color: Colors.black,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                trailing: Text(
                                  '${report.summary!.onLeave.toString()} days',
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
                    height: 20.h,
                  ),
                  Text(
                    'Daily Report',
                    style: GoogleFonts.inter(
                      color: Colors.black,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  ...List.generate(
                    report.dailyReport!.length,
                    (index) {
                      final date = report.dailyReport![index].date.toString();
                      final isSunday = DateTime.parse(date).weekday == 7;
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 10.w),
                          child: Card(
                            child: Container(
                              height: 100.h,
                              width: double.infinity,
                              color: Colors.white,
                              child: Row(
                                children: [
                                  Container(
                                    height: 100.h,
                                    width: 100.w,
                                    color: Color.fromARGB(255, 254, 245, 240),
                                    child: Center(
                                      child: Text(
                                        getweekday(date),
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.inter(
                                          color: Colors.grey,
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  isSunday
                                      ? Container(
                                          height: 30.h,
                                          width: 80.w,
                                          decoration: ShapeDecoration(
                                            color: Colors.black,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.r),
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              'Weekend',
                                              style: GoogleFonts.inter(
                                                color: Colors.white,
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        )
                                      : Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              height: 50.h,
                                              width: 240.w,
                                              child: Row(
                                                children: [
                                                  Container(
                                                    height: 50.h,
                                                    width: 50.w,
                                                    child: Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 15.h),
                                                      child: Text(
                                                        'IN',
                                                        style:
                                                            GoogleFonts.inter(
                                                          color: Colors.black,
                                                          fontSize: 15.sp,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 50.w,
                                                  ),
                                                  Container(
                                                    height: 30.h,
                                                    width: 70.w,
                                                    decoration: ShapeDecoration(
                                                      color: Colors.green,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.r),
                                                      ),
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        '09:30',
                                                        style:
                                                            GoogleFonts.inter(
                                                          color: Colors.white,
                                                          fontSize: 15.sp,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              height: 50.h,
                                              width: 240.w,
                                              child: Row(
                                                children: [
                                                  Container(
                                                    height: 50.h,
                                                    width: 50.w,
                                                    child: Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 15.h),
                                                      child: Text(
                                                        'OUT',
                                                        style:
                                                            GoogleFonts.inter(
                                                          color: Colors.black,
                                                          fontSize: 15.sp,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 50.w,
                                                  ),
                                                  Container(
                                                    height: 30.h,
                                                    width: 70.w,
                                                    decoration: ShapeDecoration(
                                                      color: Colors.red,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.r),
                                                      ),
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        '05:30',
                                                        style:
                                                            GoogleFonts.inter(
                                                          color: Colors.white,
                                                          fontSize: 15.sp,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        )
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  )
                ],
              );
            } else {
              return SizedBox();
            }
          },
        ),
      ),
    );
  }
}
