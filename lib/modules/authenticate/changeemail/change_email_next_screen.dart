import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_guys_run/commons/widgets/button/submit_button.dart';

import 'package:mobile_guys_run/commons/widgets/app_bar/app_bar.dart';
import 'package:mobile_guys_run/commons/widgets/textfield/email.dart';

import 'package:mobile_guys_run/app/cubit/app_cubit.dart';
import 'package:mobile_guys_run/modules/nav_bar_handler/nav_bar_handler.dart';


class ChangeEmailNextScreen extends StatefulWidget {
  const ChangeEmailNextScreen({Key? key}) : super(key: key);
  static const String route = '/profile/change_email/new';

  @override
  State<ChangeEmailNextScreen> createState() => _ChangeEmailNextScreenState();
}

class _ChangeEmailNextScreenState extends State<ChangeEmailNextScreen> {
  late AppCubit appCubit;

  void navigate() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const NavBarHandler()));
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
                    const AppBarDetail(title: "CHANGE EMAIL", isBack: true),
                    SizedBox(height: 28.h),
                    const InputEmail(hintText: "New email"),
                    SizedBox(height: 40.h),
                    SubmitButton(title: "Change email",
                        onPressButton: navigate),
                  ],
                ))));
  }
}