import 'dart:async';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:pr_2/Ui/Attendance_details.dart';

import '../Bloc/CheckIn/check_in_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String Qrcoderesult = '';
  DateTime currentTime = DateTime.now();
  late Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 1), (Timer t) => _updateTime());
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  void _updateTime() {
    setState(() {
      currentTime = DateTime.now();
    });
  }

  Future<void> checkInQRscanner() async {
    String ResultData;
    try {
      ResultData = await FlutterBarcodeScanner.scanBarcode(
          "#ff6666", "cancel", true, ScanMode.QR);

      setState(() {
        Qrcoderesult = ResultData;
        print('Result:$Qrcoderesult');
      });
      BlocProvider.of<CheckInBloc>(context).add(FetchCheckIn(qr: Qrcoderesult));
    } on PlatformException {
      ResultData = 'Failed to Scan !';
    }
  }
  Future<void> checkOutQRscanner() async {
    String ResultData;
    try {
      ResultData = await FlutterBarcodeScanner.scanBarcode(
          "#ff6666", "cancel", true, ScanMode.QR);

      setState(() {
        Qrcoderesult = ResultData;
        print('Result:$Qrcoderesult');
      });
    } on PlatformException {
      ResultData = 'Failed to Scan !';
    }
  }
  Future<void> overTimeCheckInQRscanner() async {
    String ResultData;
    try {
      ResultData = await FlutterBarcodeScanner.scanBarcode(
          "#ff6666", "cancel", true, ScanMode.QR);

      setState(() {
        Qrcoderesult = ResultData;
        print('Result:$Qrcoderesult');
      });
    } on PlatformException {
      ResultData = 'Failed to Scan !';
    }
  }
  Future<void> overTimeCheckOutQRscanner() async {
    String ResultData;
    try {
      ResultData = await FlutterBarcodeScanner.scanBarcode(
          "#ff6666", "cancel", true, ScanMode.QR);

      setState(() {
        Qrcoderesult = ResultData;
        print('Result:$Qrcoderesult');
      });
    } on PlatformException {
      ResultData = 'Failed to Scan !';
    }
  }

  bool _isCheckedin = true;
  void checkIn() {
    setState(() {
      _isCheckedin = true; // Set status to checked in
    });
  }

  void checkOut() {
    setState(() {
      _isCheckedin = false; // Set status to checked out
    });
  }

// Enable overtime tab view only between 6:00 PM and 11:59 PM
  bool get isOvertimeAllowed =>
      currentTime.hour >= 18 && currentTime.hour <= 23;



  Widget _buildCheckInUI() {
    return
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            SizedBox(height: 80.h),
            Center(
              child: Container(
                width: 300.w,
                height: 100.h,
                child: Column(
                  children: [
                    Text(
                      '${currentTime.hour % 12 == 0 ? 12 : currentTime.hour % 12}:${currentTime.minute.toString().padLeft(2, '0')} ${currentTime.hour >= 12 ? 'PM' : 'AM'}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 40.sp,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      '${DateFormat.MMMMEEEEd().format(currentTime)}',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24.sp,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30.h),
            GestureDetector(
              onTap:_isCheckedin ? checkInQRscanner:checkOutQRscanner,
              child: CircleAvatar(
                radius: 110.r,
                backgroundColor: _isCheckedin ? Color(0xFFFF6000) : Colors.pink,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        BootstrapIcons.hand_index_thumb,
                        color: Colors.white,
                        size: 80.sp,
                      ),
                      SizedBox(height: 20.h),
                      Text(
                        _isCheckedin ? 'Check in' : 'Check out',
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w500,
                          height: 1.2,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 80.h),
            Container(
              width: double.infinity,
              height: 100.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: checkIn,
                    child: Column(
                      children: [
                        Icon(
                          BootstrapIcons.clock,
                          color: _isCheckedin ? Color(0xFFFF6000) : Colors.pink,
                          size: 30.sp,
                        ),
                        Text('--:--', style: TextStyle(fontSize: 22.sp)),
                        Text('Check In', style: TextStyle(fontSize: 15.sp)),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: checkOut,
                    child: Column(
                      children: [
                        Icon(
                          BootstrapIcons.clock,
                          color: _isCheckedin ? Color(0xFFFF6000) : Colors.pink,
                          size: 30.sp,
                        ),
                        Text('--:--', style: TextStyle(fontSize: 22.sp)),
                        Text('Check Out', style: TextStyle(fontSize: 15.sp)),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Icon(
                        BootstrapIcons.clock_history,
                        color: _isCheckedin ? Color(0xFFFF6000) : Colors.pink,
                        size: 30.sp,
                      ),
                      Text('--:--', style: TextStyle(fontSize: 22.sp)),
                      Text('Working Hrs', style: TextStyle(fontSize: 15.sp)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );
  }

  Widget _buildOvertimeUI() {
    return
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            SizedBox(height: 80.h),
            Center(
              child: Container(
                width: 300.w,
                height: 100.h,
                child: Column(
                  children: [
                    Text(
                      '${currentTime.hour % 12 == 0 ? 12 : currentTime.hour % 12}:${currentTime.minute.toString().padLeft(2, '0')} ${currentTime.hour >= 12 ? 'PM' : 'AM'}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 40.sp,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      '${DateFormat.MMMMEEEEd().format(currentTime)}',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24.sp,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30.h),
            GestureDetector(
              onTap: _isCheckedin ? overTimeCheckInQRscanner:overTimeCheckOutQRscanner,
              child: CircleAvatar(
                radius: 110.r,
                backgroundColor: _isCheckedin ? Color(0xFFFF6000) : Colors.pink,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        BootstrapIcons.hand_index_thumb,
                        color: Colors.white,
                        size: 80.sp,
                      ),
                      SizedBox(height: 20.h),
                      Text(
                        _isCheckedin ? 'Check in' : 'Check out',
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w500,
                          height: 1.2,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 80.h),
            Container(
              width: double.infinity,
              height: 100.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: checkIn,
                    child: Column(
                      children: [
                        Icon(
                          BootstrapIcons.clock,
                          color: _isCheckedin ? Color(0xFFFF6000) : Colors.pink,
                          size: 30.sp,
                        ),
                        Text('--:--', style: TextStyle(fontSize: 22.sp)),
                        Text('Check In', style: TextStyle(fontSize: 15.sp)),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: checkOut,
                    child: Column(
                      children: [
                        Icon(
                          BootstrapIcons.clock,
                          color: _isCheckedin ? Color(0xFFFF6000) : Colors.pink,
                          size: 30.sp,
                        ),
                        Text('--:--', style: TextStyle(fontSize: 22.sp)),
                        Text('Check Out', style: TextStyle(fontSize: 15.sp)),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Icon(
                        BootstrapIcons.clock_history,
                        color: _isCheckedin ? Color(0xFFFF6000) : Colors.pink,
                        size: 30.sp,
                      ),
                      Text('--:--', style: TextStyle(fontSize: 22.sp)),
                      Text('Working Hrs', style: TextStyle(fontSize: 15.sp)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: Size(411, 823));

    return DefaultTabController(
      length: isOvertimeAllowed ? 2 : 1,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: _isCheckedin ? Color(0xFFFF6000) : Colors.pink,
          automaticallyImplyLeading: false,
          title: Text(
            'Attendance',
            style: GoogleFonts.inter(
              color: Colors.white,
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
            ),
          ),actions: [ GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => AttendenceDetails()),
            );
          },
          child: Padding(
            padding: EdgeInsets.only(right: 20.w),
            child: Row(
              children: [
                Icon(BootstrapIcons.clipboard2, color: Colors.white),
                SizedBox(width: 5.w),
                Text(
                  'Report',
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),],
          bottom: isOvertimeAllowed
              ? TabBar(
            tabs: [
              Tab(text: 'Regular'),
              Tab(text: 'Overtime'),
            ],
          )
              : null,
        ),
        body: isOvertimeAllowed
            ? TabBarView(
          children: [
            _buildCheckInUI(),
            _buildOvertimeUI(),
          ],
        )
            : _buildCheckInUI(),
      ),
    );
  }
}