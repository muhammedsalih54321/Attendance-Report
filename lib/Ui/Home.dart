import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:pr_2/Ui/Attendance_details.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  String Qrcoderesult = '';
  var Time = DateTime.now();

  Future<void> QRscanner() async {
    String ResultData;
    try {
      ResultData = await FlutterBarcodeScanner.scanBarcode(
          "#ff6666", "cancel", true, ScanMode.QR);

      print('Result:$ResultData');
      setState(() {
        Qrcoderesult = ResultData;
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

  // Check Out function
  void checkOut() {
    setState(() {
      _isCheckedin = false; // Set status to checked out
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _isCheckedin == true ? Color(0xFFFF6000) : Colors.pink,
        automaticallyImplyLeading: false,
        title: Text(
          'Attendence',
          style: GoogleFonts.inter(
              color: Colors.white,
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
              height: 0.10),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => AttendenceDetails()));
            },
            child: Padding(
              padding: EdgeInsets.only(right: 20.w),
              child: Row(
                children: [
                  Icon(
                    BootstrapIcons.clipboard2,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => AttendenceDetails()));
                    },
                    child: Text(
                      'Report',
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            SizedBox(
              height: 80.h,
            ),
            Center(
              child: Container(
                width: 300.w,
                height: 100.h,
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        '${Time.hour >= 12 ? '0' : ''}${Time.hour % 12 == 0 ? 12 : Time.hour % 12}:${Time.minute.toString().padLeft(2, '0')} ${Time.hour >= 12 ? 'PM' : 'AM'}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 40,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      '${DateFormat.MMMMEEEEd().format(Time)}',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            GestureDetector(
              onTap: () {
                _isCheckedin ? QRscanner() : QRscanner();
              },
              child: CircleAvatar(
                radius: 110.r,
                backgroundColor:
                    _isCheckedin == true ? Color(0xFFFF6000) : Colors.pink,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        BootstrapIcons.hand_index_thumb,
                        color: Colors.white,
                        size: 80.sp,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        _isCheckedin == true ? 'Check in' : 'Check out',
                        style: GoogleFonts.inter(
                            color: Colors.white,
                            fontSize: 22.sp,
                            fontWeight: FontWeight.w500,
                            height: 0.10),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 80.h,
            ),
            Container(
                width: double.infinity.w,
                height: 100.h,
                child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: checkIn,
                        child: Container(
                            width: 110.w,
                            height: 100.h,
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    BootstrapIcons.clock,
                                    color: _isCheckedin == true
                                        ? Color(0xFFFF6000)
                                        : Colors.pink,
                                    size: 30.sp,
                                  ),
                                  Text(
                                    '--:--',
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
                                ])),
                      ),
                      GestureDetector(
                        onTap: checkOut,
                        child: Container(
                            width: 110.w,
                            height: 100.h,
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    BootstrapIcons.clock,
                                    color: _isCheckedin == true
                                        ? Color(0xFFFF6000)
                                        : Colors.pink,
                                    size: 30.sp,
                                  ),
                                  Text(
                                    '--:--',
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
                                ])),
                      ),
                      Container(
                          width: 110.w,
                          height: 100.h,
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  BootstrapIcons.clock_history,
                                  color: _isCheckedin == true
                                      ? Color(0xFFFF6000)
                                      : Colors.pink,
                                  size: 30.sp,
                                ),
                                Text(
                                  '--:--',
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
                              ])),
                    ])),
          ],
        ),
      ),
    );
  }
}
