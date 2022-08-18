import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



import 'package:mobile_guys_run/commons/widgets/app_bar/app_bar.dart';
import 'package:mobile_guys_run/commons/widgets/app_bar/app_bar_common.dart';


import 'package:mobile_guys_run/app/cubit/app_cubit.dart';
import 'package:mobile_guys_run/commons/widgets/textfield/text.dart';



import '../../../commons/widgets/container/send_code.dart';

class ChangeEmailCodeScreen extends StatefulWidget {
  const ChangeEmailCodeScreen({Key? key}) : super(key: key);
  static const String route = '/profile/change_email/code';

  @override
  State<ChangeEmailCodeScreen> createState() => _ChangeEmailCodeScreenState();
}

class _ChangeEmailCodeScreenState extends State<ChangeEmailCodeScreen> {
  late AppCubit appCubit;

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
                    const InputText(),
                    SizedBox(height: 10.h),
                    Center(
                        child: Text("Resend code in 00:59", style: appCubit.styles.defaultPurpleTextStyle())
                    ),
                    SizedBox(height: 444.h),
                  ],
                ))));
  }
}