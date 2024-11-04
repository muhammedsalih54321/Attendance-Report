import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pr_2/Bloc/Login/login_bloc.dart';
import 'package:pr_2/Bloc/Report/report_bloc.dart';
import 'package:pr_2/Bloc/TodayAttendence/today_attendence_bloc.dart';
import 'package:pr_2/Ui/Splash_screen.dart';

import 'Bloc/CheckIn/check_in_bloc.dart';
import 'Bloc/CheckOut/check_out_bloc.dart';
import 'Bloc/OverTimeCheckIn/over_time_check_in_bloc.dart';
import 'Bloc/OverTimeCheckout/over_time_check_out_bloc.dart';
import 'Bloc/RefreshToken/referesh_token_bloc.dart';





void main() {
  runApp(const MyApp());
}

String basePath = 'http://45.159.221.50:5335';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(390, 845),
        builder: (BuildContext context, Widget? child) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => LoginBloc()),
              BlocProvider(create: (context) => ReportBloc()),
              BlocProvider(create: (context) => CheckInBloc()),
              BlocProvider(create: (context) => CheckOutBloc()),
              BlocProvider(create: (context) => OverTimeCheckInBloc()),
              BlocProvider(create: (context) => OverTimeCheckOutBloc()),
              BlocProvider(create: (context) => RefereshTokenBloc()),
              BlocProvider(create: (context) => TodayAttendenceBloc()),
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Attendance report',
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor:Color(0xFFFF6000)),
                useMaterial3: true,
              ),
              home:SplashScreen(),
            ),
          );
        });
  }
}
