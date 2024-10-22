import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AttendenceDetails extends StatefulWidget {
  const AttendenceDetails({super.key});

  @override
  State<AttendenceDetails> createState() => _AttendenceDetailsState();
}

class _AttendenceDetailsState extends State<AttendenceDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:  Color(0xFFFFE7D9),
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
        body: Padding(
          padding: EdgeInsets.all(15),
          child: Table(
            border: TableBorder.all(color: Colors.grey),
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: [
              TableRow(
                  decoration: BoxDecoration(color:  Color(0xFFFFE7D9)),
                  children: [
                    TableCell(
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Text(
                          'Date',
                          style: GoogleFonts.inter(
                              color: Colors.black,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500,
                              height: 0.10),
                        ),
                      ),
                      verticalAlignment: TableCellVerticalAlignment.middle,
                    ),
                    TableCell(
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Text(
                          'Checkin Time',
                          style: GoogleFonts.inter(
                            color: Colors.black,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      verticalAlignment: TableCellVerticalAlignment.middle,
                    ),
                    TableCell(
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Text(
                          'Checkout Time',
                          style: GoogleFonts.inter(
                            color: Colors.black,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      verticalAlignment: TableCellVerticalAlignment.middle,
                    ),
                     TableCell(
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Text(
                          'Working Hr\'s',
                          style: GoogleFonts.inter(
                            color: Colors.black,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      verticalAlignment: TableCellVerticalAlignment.middle,
                    )
                  ]),
              ...List.generate(
                10,
                (index) {
                  return TableRow(
                      decoration: BoxDecoration(color:  Color(0xFFFFE7D9)),
                      children: [
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(8),
                            child: Text('2024-10-19'),
                          ),
                          verticalAlignment: TableCellVerticalAlignment.middle,
                        ),
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(8),
                            child: Text('09:21:12'),
                          ),
                          verticalAlignment: TableCellVerticalAlignment.middle,
                        ),
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(8),
                            child: Text('05:41:12'),
                          ),
                          verticalAlignment: TableCellVerticalAlignment.middle,
                        ),
                         TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(8),
                            child: Text('09h'),
                          ),
                          verticalAlignment: TableCellVerticalAlignment.middle,
                        )
                      ]);
                },
              )
            ],
          ),
        ));
  }
}
