import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:mobile_guys_run/commons/widgets/app_bar/app_bar.dart';
import 'package:mobile_guys_run/commons/widgets/app_bar/app_bar_common.dart';

import 'package:mobile_guys_run/app/cubit/app_cubit.dart';
import 'package:mobile_guys_run/commons/widgets/textfield/text.dart';

import '../../../commons/widgets/dialog/dialog.dart';
import '../../nav_bar_handler/nav_bar_handler.dart';
import '../find/find_screen.dart';
import '../signin/sign_in_screen.dart';

class SignUpCodeScreen extends StatefulWidget {
  const SignUpCodeScreen({Key? key}) : super(key: key);
  static const route = '/signup/code';
  @override
  State<SignUpCodeScreen> createState() => _SignUpCodeScreenState();
}

class _SignUpCodeScreenState extends State<SignUpCodeScreen> {
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
                const InputText(),
                SizedBox(height: 10.h),
                Center(
                    child: Text("Resend code in 00:59",
                        style: appCubit.styles.defaultPurpleTextStyle())),
                SizedBox(height: 444.h),
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      32.w, 0, 32.w, 62.h),
                                  child: CustomDialog(title: "Forgotten password?"
                                      , up: "Yes", down: "Continue to register", height: 178.w
                                      , actionUp: (){navigate(context, FindScreen.route);}),
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
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      32.w, 0, 32.w, 62.h),
                                  child: CustomDialog(title: "Do you already have an account?"
                                      , up: "Yes", down: "Continue to register", height: 200.w
                                      , actionUp: (){navigate(context, SignInScreen.route);}),
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
