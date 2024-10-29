import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pr_2/Bloc/Login/login_bloc.dart';
import 'package:pr_2/Repository/Model/Login_model.dart';
import 'package:pr_2/Ui/Home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final Email = TextEditingController();
  final password = TextEditingController();
  final formKey = GlobalKey<FormState>();
  var isobscure;
  bool ischecked = false;
  late LoginModel login;
  @override
  void initState() {
    isobscure = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFE7D9),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              height: 365.h,
            ),
            Container(
              width: double.infinity.w,
              height: 480.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(38.r),
                    topRight: Radius.circular(38.r)),
                border: Border(
                  left: BorderSide(),
                  top: BorderSide(width: .2.w),
                  right: BorderSide(),
                  bottom: BorderSide(),
                ),
                color: Colors.white,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 55.h,
                        ),
                        Text(
                          'Login',
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 22.sp,
                            fontWeight: FontWeight.w600,
                            height: 0.07,
                          ),
                        ),
                        Text(
                          'Enter your user name to login for this app',
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            height: 4.h,
                          ),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        TextFormField(
                          textInputAction: TextInputAction.next,
                          controller: Email,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Color(0xFFF1F2F3),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                          Color.fromARGB(255, 223, 220, 220))),
                              focusedBorder: InputBorder.none,
                              labelText: 'Email',
                              labelStyle: GoogleFonts.poppins(
                                color: Color(0xFF7C7C7C),
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                height: 0.10,
                              )),
                          validator: (email) {
                            if (email!.isEmpty ||
                                !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(email)) {
                              return 'Enter a valid email!';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        TextFormField(
                          controller: password,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Color(0xFFF1F2F3),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                          Color.fromARGB(255, 223, 220, 220))),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                          Color.fromARGB(255, 223, 220, 220)),
                                  borderRadius: BorderRadius.circular(8.r)),
                              labelText: 'Enter password  ',
                              labelStyle: GoogleFonts.poppins(
                                color: Color(0xFF7C7C7C),
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                height: 0.10,
                              ),
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isobscure = !isobscure;
                                    });
                                  },
                                  icon: isobscure
                                      ? Icon(
                                          BootstrapIcons.eye,
                                          color: Colors.grey,
                                          size: 20.sp,
                                        )
                                      : Icon(
                                          BootstrapIcons.eye_slash,
                                          color: Colors.grey,
                                          size: 20.sp,
                                        ))),
                          obscureText: isobscure,
                          validator: (password) {
                            if (password!.isEmpty || password.length < 6) {
                              return 'Enter a valid password!';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'forget password',
                              style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                height: 0.12,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 65.h,
                        ),
                        BlocListener<LoginBloc, LoginState>(
                          listener: (context, state) {
                            if (state is Loginblocloading) {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                },
                              );
                            }
                            if (state is LoginblocError) {
                              Navigator.of(context).pop();
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return Center(
                                    child: Text(
                                      'Something Wrong',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  );
                                },
                              );
                            }
                            if (state is Loginblocloaded) {
                              login = BlocProvider.of<LoginBloc>(context)
                                  .loginModel;
                              token(login.token!.access.toString(),login.token!.refresh.toString());
                              
                              Navigator.of(context).pop();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => HomeScreen()));
                            }
                          },
                          child: GestureDetector(
                            onTap: () {
                              if (formKey.currentState!.validate()) {
                                BlocProvider.of<LoginBloc>(context).add(
                                    FetchloginEvent(
                                        email: Email.text,
                                        password: password.text));
                              }
                            },
                            child: Container(
                              height: 50.h,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.r),
                                  color: Color(0xFFFF6000)),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Login',
                                      style: GoogleFonts.inter(
                                          color: Colors.white,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500,
                                          height: 0.10),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void token(String token,String refresh) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('Token', token);
    prefs.setString('Refresh', refresh);

  }
}
