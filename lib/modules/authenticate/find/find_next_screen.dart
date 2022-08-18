import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_guys_run/commons/widgets/button/submit_button.dart';

import 'package:mobile_guys_run/commons/widgets/app_bar/app_bar.dart';
import 'package:mobile_guys_run/commons/widgets/textfield/email.dart';

import 'package:mobile_guys_run/app/cubit/app_cubit.dart';
import 'package:mobile_guys_run/commons/widgets/textfield/password.dart';
import 'package:mobile_guys_run/modules/nav_bar_handler/nav_bar_handler.dart';

import '../../../commons/widgets/app_bar/app_bar_common.dart';


class FindNextScreen extends StatefulWidget {
  const FindNextScreen({Key? key}) : super(key: key);
  static const String route = '/find/next';
  @override
  State<FindNextScreen> createState() => _FindNextScreenState();
}

class _FindNextScreenState extends State<FindNextScreen> {
  late AppCubit appCubit;

  void navigateHome() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const NavBarHandler()));
  }

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
                const AppBarDetail(title: "FIND", isBack: true),
                SizedBox(height: 28.h),
                const InputEmail(hintText: "@gmail"),
                SizedBox(height: 16.h),
                const InputPassword(hintText: "New password"),
                SizedBox(height: 16.h),
                const InputPassword(hintText: "Confirm password"),
                SizedBox(height: 40.h),
                SubmitButton(title: "Sign in", onPressButton: navigateHome),
                SizedBox(height: 34.h),
                Padding(
                    padding: EdgeInsets.fromLTRB(16.w, 0, 42.w, 0),
                    child: RichText(
                      text: TextSpan(
                          style: appCubit.styles.defaultTextStyle(),
                          children: [
                            const TextSpan(
                                text: 'By continuing, you agree to'),
                            TextSpan(
                                text:
                                    ' GUYS.run Terms & Conditions and Privacy Policy.',
                                style:
                                    appCubit.styles.defaultPurpleTextStyle())
                          ]),
                    )),
                SizedBox(height: 112.h)
              ],
            ))));
  }
}
