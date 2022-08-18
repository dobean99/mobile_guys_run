import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_guys_run/commons/widgets/button/submit_button.dart';

import 'package:mobile_guys_run/commons/widgets/app_bar/app_bar.dart';
import 'package:mobile_guys_run/app/cubit/app_cubit.dart';
import 'package:mobile_guys_run/commons/widgets/textfield/password.dart';
import 'change_pass_code_screen.dart';

class ChangePassScreen extends StatefulWidget {
  const ChangePassScreen({Key? key}) : super(key: key);
  static const String route = '/profile/change_password';

  @override
  State<ChangePassScreen> createState() => _ChangePassScreenState();
}

class _ChangePassScreenState extends State<ChangePassScreen> {
  late AppCubit appCubit;

  void navigate() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const ChangePassCodeScreen()));
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
                    const AppBarDetail(title: "CHANGE PASSWORD", isBack: true),
                    SizedBox(height: 28.h),
                    const InputPassword(hintText: "Old password"),
                    SizedBox(height: 40.h),
                    SubmitButton(title: "Send code",
                        onPressButton: navigate),
                  ],
                ))));
  }
}