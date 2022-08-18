import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



import 'package:mobile_guys_run/commons/widgets/app_bar/app_bar.dart';

import 'package:mobile_guys_run/app/cubit/app_cubit.dart';
import 'package:mobile_guys_run/modules/authenticate/find/find_next_screen.dart';
import 'package:mobile_guys_run/modules/nav_bar_handler/nav_bar_handler.dart';
import '../../../commons/widgets/app_bar/app_bar_common.dart';
import '../../../commons/widgets/dialog/dialog.dart';
import '../../../commons/widgets/textfield/text.dart';
import '../signin/sign_in_screen.dart';
import '../signup/sign_up_screen.dart';
import 'cubit/find_cubit.dart';
import 'find_screen.dart';

class FindCodeScreen extends StatefulWidget {
  const FindCodeScreen({Key? key}) : super(key: key);
  static const String route = '/find/code';
  @override
  State<FindCodeScreen> createState() => _FindCodeScreenState();
}

class _FindCodeScreenState extends State<FindCodeScreen> {
  late AppCubit appCubit;
  final TextEditingController otpController  = TextEditingController();
  late FindCubit findCubit;
  void navigateSignIn() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const SignInScreen()));
  }

  void navigateForgot() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const FindScreen()));
  }

  void navigateSignUp() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const SignUpScreen()));
  }

  // void verifyOTP() async {
  //  var res = EmailAuth.validateOtp(
  //      recipientMail: _emailcontroller.value.text,
  //      userOtp: _otpcontroller.value.text)
  // }
  @override
  void initState() {
    super.initState();
    appCubit = context.read<AppCubit>();
    findCubit = FindCubit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const AppBarCommon(),
        backgroundColor: appCubit.styles.themeData!.backgroundColor,
        body: Padding(
            padding: EdgeInsets.fromLTRB(32.w, 10.h, 32.w, 0),
            child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //const AppBarCommon(),
                    SizedBox(height: 42.h),
                    const AppBarDetail(title: "FIND", isBack: true),
                    SizedBox(height: 28.h),
                    BlocListener<FindCubit,FindState>(
                      bloc: findCubit,
                      listener: (context, state){
                        if(state is FindCodeSubmit){
                          navigate(context, FindNextScreen.route);
                        }
                      },
                      child: Form(
                          child: InputText(controller: otpController)
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Center(
                        child: Text("Resend code in 00:59", style: appCubit.styles.defaultPurpleTextStyle())
                    ),
                    SizedBox(height: 444.h),
                    Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            behavior: HitTestBehavior.deferToChild,
                            onTap: () {
                              showDialog(context: context,
                                  builder: (BuildContext context) {
                                    return Padding(
                                      padding: EdgeInsets.fromLTRB(32.w, 0, 32.w, 62.h),
                                      child:CustomDialog(title: "Forgotten password?"
                                          , up: "Yes", down: "Continue to register", height: 178.w
                                          , actionUp: (){navigate(context, FindScreen.route);},
                                          actionDown: () {navigate(context, SignUpScreen.route);}),
                                    );
                                  });
                            },
                            child: Text(
                              "Forgotten password?",
                              style: appCubit.styles.defaultPurpleTextStyle(),
                            ),
                          ),
                          SizedBox(height: 28.h),
                          GestureDetector(
                            onTap: () {
                              showDialog(context: context,
                                  builder: (BuildContext context) {
                                    return Padding(
                                      padding: EdgeInsets.fromLTRB(32.w, 0, 32.w, 62.h),
                                      child: CustomDialog(title: "Do you already have an account?"
                                          , up: "Yes", down: "Continue to register", height: 200.w
                                          , actionUp: (){navigate(context, SignInScreen.route);}
                                          , actionDown: () {navigate(context, SignUpScreen.route);}),
                                    );
                                  });
                            },
                            child: Text("Do you have any account?",
                                style: appCubit.styles.defaultPurpleTextStyle()),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 112.h)
                  ],
                ))));
  }
}