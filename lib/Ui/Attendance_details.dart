import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:pr_2/Bloc/Report/report_bloc.dart';
import 'package:pr_2/Repository/Model/Report_model.dart';
import 'package:table_calendar/table_calendar.dart';

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

  DateTime _currentDate = DateTime.now();
  DateTime _selectedDate = DateTime.now();

  // Method to show the month and year picker dialog
  Future<void> _openMonthYearPickerDialog() async {
    DateTime _tempSelectedDate = _selectedDate;

    DateTime? pickedDate = await showDialog<DateTime>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Select Month and Year'),
          content: SizedBox(
            height: 526.h, // Increase height to accommodate the OK button
            width: 500.w,
            child: Column(
              children: [
                Expanded(
                  child: TableCalendar(
                    focusedDay: _tempSelectedDate,
                    firstDay: DateTime(2000),
                    lastDay: DateTime(2100),
                    calendarFormat: CalendarFormat.month,
                    headerStyle: HeaderStyle(
                      formatButtonVisible: false,
                      titleCentered: true,
                    ),
                    onPageChanged: (focusedDay) {
                      _tempSelectedDate = focusedDay;
                    },
                    onDaySelected: (selectedDay, focusedDay) {
                      _tempSelectedDate =
                          focusedDay; // Update temporary selection
                    },
                    calendarBuilders: CalendarBuilders(
                      defaultBuilder: (context, date, _) => Container(),
                      todayBuilder: (context, date, _) => Container(),
                      selectedBuilder: (context, date, _) => Container(),
                    ),
                  ),
                ),
                SizedBox(height: 3.h),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(
                        context, _tempSelectedDate); // Return the selected date
                  },
                  child: Text("OK"),
                ),
              ],
            ),
          ),
        );
      },
    );

    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  } // Initially set to current date

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
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 350.h,),
                  Center(
                    child: CircularProgressIndicator(),
                  ),
                ],
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
                            '${DateFormat('MMMM').format(_selectedDate)},${DateFormat('yyyy').format(_selectedDate)}',
                            style: GoogleFonts.inter(
                              color: Colors.black,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              _openMonthYearPickerDialog().then(
                                (value) {
                                  setState(() {
                                    BlocProvider.of<ReportBloc>(context).add(
                                        FetchReportEvent(
                                            month:
                                                _selectedDate.month.toString(),
                                            Year:
                                                _selectedDate.year.toString()));
                                  });
                                },
                              );
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
                        color: Colors.white,
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
                              height: 201.h,
                              width: double.infinity,
                              color: Colors.white,
                              child: Row(
                                children: [
                                  Container(
                                    height: 201.h,
                                    width: 88.w,
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
                                                    width: 120.w,
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
                                                    width: 120.w,
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
                                            Container(height: .5.h,width: 248.w,color: Colors.black,),
                                             Container(
                                              height: 50.h,
                                              width: 240.w,
                                              child: Row(
                                                children: [
                                                  Container(
                                                    height: 50.h,
                                                    width: 120.w,
                                                    child: Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 15.h),
                                                      child: Text(
                                                        'OVERTIMEIN',
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
                                                    height: 60.h,
                                                    width: 120.w,
                                                    child: Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 15.h),
                                                      child: Text(
                                                        'OVERTIMEOUT',
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
