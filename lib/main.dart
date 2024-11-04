import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pr_2/Bloc/Login/login_bloc.dart';
import 'package:pr_2/Bloc/Refresh/refresh_bloc.dart';
import 'package:pr_2/Bloc/Report/report_bloc.dart';
import 'package:pr_2/Ui/Splash_screen.dart';





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
              BlocProvider(create: (context) => RefreshBloc())
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
