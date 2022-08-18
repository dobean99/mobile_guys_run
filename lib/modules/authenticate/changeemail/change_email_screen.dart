import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_guys_run/commons/widgets/button/submit_button.dart';

import 'package:mobile_guys_run/commons/widgets/app_bar/app_bar.dart';
import 'package:mobile_guys_run/commons/widgets/textfield/email.dart';

import 'package:mobile_guys_run/app/cubit/app_cubit.dart';
import 'package:mobile_guys_run/modules/authenticate/changeemail/change_email_code_screen.dart';


class ChangeEmailScreen extends StatefulWidget {
  const ChangeEmailScreen({Key? key}) : super(key: key);
  static const String route = '/profile/change_email';

  @override
  State<ChangeEmailScreen> createState() => _ChangeEmailScreenState();
}

class _ChangeEmailScreenState extends State<ChangeEmailScreen> {
  late AppCubit appCubit;

  void navigate() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const ChangeEmailCodeScreen()));
  }

  @override
  void initState() {
    super.initState();
    appCubit = context.read<AppCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: appCubit.styles.themeData!.backgroundColor,
        body: Padding(
            padding: EdgeInsets.fromLTRB(32.w, 0, 32.w, 0),
            child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppBarDetail(title: "CHANGE EMAIL", isBack: true),
                    SizedBox(height: 28.h),
                    const InputEmail(hintText: "New email"),
                    SizedBox(height: 40.h),
                    SubmitButton(title: "Send code",
                        onPressButton: navigate),
                  ],
                ))));
  }
}