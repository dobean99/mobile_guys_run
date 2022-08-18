import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_guys_run/commons/widgets/button/submit_button.dart';
import 'package:mobile_guys_run/commons/widgets/app_bar/app_bar.dart';
import 'package:mobile_guys_run/commons/widgets/app_bar/app_bar_common.dart';
import 'package:mobile_guys_run/commons/widgets/dialog/dialog.dart';
import 'package:mobile_guys_run/commons/widgets/textfield/email.dart';
import 'package:mobile_guys_run/app/cubit/app_cubit.dart';
import 'package:mobile_guys_run/commons/widgets/textfield/password.dart';
import 'package:mobile_guys_run/modules/authenticate/signup/sign_up_code_screen.dart';

import 'package:mobile_guys_run/modules/nav_bar_handler/nav_bar_handler.dart';

import '../find/find_screen.dart';
import '../signin/sign_in_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  static const String route = '/sign_up';
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late AppCubit appCubit;
  @override
  void initState() {
    super.initState();
    appCubit = context.read<AppCubit>();
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
                const AppBarDetail(title: "SIGN UP", isBack: true),
                SizedBox(height: 28.h),
                const InputEmail(hintText: "@gmail"),
                SizedBox(height: 16.h),
                const InputPassword(hintText: "Password"),
                SizedBox(height: 16.h),
                const InputPassword(hintText: "Confirm password"),
                SizedBox(height: 40.h),
                SubmitButton(title: "Send code",
                    onPressButton: () {
                      navigate(context, SignUpCodeScreen.route);
                    }),
                SizedBox(height: 34.h),
                Padding(
                    padding: EdgeInsets.fromLTRB(16.w, 0, 42.w, 0),
                    child: RichText(
                      text: TextSpan(
                          style: appCubit.styles.defaultTextStyle(),
                          children: [
                            const TextSpan(text: 'By continuing, you agree to'),
                            TextSpan(
                                text:
                                    ' GUYS.run Terms & Conditions and Privacy Policy.',
                                style:
                                appCubit.styles.defaultPurpleTextStyle())
                          ]),
                    )),
                SizedBox(height: 109.h),
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
                                  child: CustomDialog(title: "Forgotten password?"
                                      , up: "Yes", down: "Continue to register", height: 178.w
                                      , actionUp: (){
                                        navigate(context, FindScreen.route);
                                      }),
                                );
                              });
                        },
                        child: Container(
                          padding: EdgeInsets.all(5.h),
                          child: Text(
                            "Forgotten password?",
                            style: appCubit.styles.defaultPurpleTextStyle(),
                          ),
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
                                      , actionUp: () {navigate(context, SignInScreen.route);}),
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
