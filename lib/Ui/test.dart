import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';


class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  DateTime? checkInTime;
  DateTime? checkOutTime;
  String checkInDisplay = '--:--';
  String checkOutDisplay = '--:--';
  String workingHoursDisplay = '--:--';

  void _updateCheckInTime() {
    setState(() {
      checkInTime = DateTime.now();
      checkInDisplay =
          DateFormat('hh:mm a').format(checkInTime!); // 12-hour format
      _calculateWorkingHours();
    });
  }

  void _updateCheckOutTime() {
    setState(() {
      checkOutTime = DateTime.now();
      checkOutDisplay =
          DateFormat('hh:mm a').format(checkOutTime!); // 12-hour format
      _calculateWorkingHours();
    });
  }

  void _calculateWorkingHours() {
    if (checkInTime != null && checkOutTime != null) {
      final difference = checkOutTime!.difference(checkInTime!);
      final hours = difference.inHours;
      final minutes = difference.inMinutes.remainder(60);
      workingHoursDisplay =
          '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
         
        }, icon: Icon(Icons.login)),
      ),
      body: Column(
        children: [
          SizedBox(height: 400.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Container(
              width: double.infinity,
              height: 100.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: _updateCheckInTime,
                    child: Container(
                      width: 110.w,
                      height: 100.h,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            BootstrapIcons.clock,
                            color: Colors.pink,
                            size: 30.sp,
                          ),
                          Text(
                            checkInDisplay,
                            style: GoogleFonts.inter(
                              color: Colors.black,
                              fontSize: 22.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'Check In',
                            style: GoogleFonts.inter(
                              color: Colors.grey,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: _updateCheckOutTime,
                    child: Container(
                      width: 110.w,
                      height: 100.h,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            BootstrapIcons.clock,
                            color: Colors.pink,
                            size: 30.sp,
                          ),
                          Text(
                            checkOutDisplay,
                            style: GoogleFonts.inter(
                              color: Colors.black,
                              fontSize: 22.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'Check Out',
                            style: GoogleFonts.inter(
                              color: Colors.grey,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 110.w,
                    height: 100.h,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          BootstrapIcons.clock_history,
                          color: Colors.pink,
                          size: 30.sp,
                        ),
                        Text(
                          workingHoursDisplay,
                          style: GoogleFonts.inter(
                            color: Colors.black,
                            fontSize: 22.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'Working Hr\'s',
                          style: GoogleFonts.inter(
                            color: Colors.grey,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
