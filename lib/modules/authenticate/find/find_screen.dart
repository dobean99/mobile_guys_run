import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_guys_run/commons/widgets/button/submit_button.dart';

import 'package:mobile_guys_run/commons/widgets/app_bar/app_bar.dart';
import 'package:mobile_guys_run/commons/widgets/app_bar/app_bar_common.dart';
import 'package:mobile_guys_run/commons/widgets/textfield/email.dart';

import 'package:mobile_guys_run/app/cubit/app_cubit.dart';
import 'package:mobile_guys_run/modules/authenticate/find/cubit/find_cubit.dart';
import 'package:mobile_guys_run/modules/authenticate/find/find_code_screen.dart';
import 'package:mobile_guys_run/modules/nav_bar_handler/nav_bar_handler.dart';

import '../signup/sign_up_screen.dart';

class FindScreen extends StatefulWidget {
  const FindScreen({Key? key}) : super(key: key);
  static const String route = '/find';
  @override
  State<FindScreen> createState() => _FindScreenState();
}

class _FindScreenState extends State<FindScreen> {
  late AppCubit appCubit;
  late TextEditingController emailController;
  late FindCubit findCubit;

  @override
  void initState() {
    super.initState();
    appCubit = context.read<AppCubit>();
    emailController = TextEditingController();
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
                    BlocListener<FindCubit, FindState>(
                      bloc: findCubit,
                      listener: (context, state){
                        if(state is FindSubmit){
                          navigate(context, FindCodeScreen.route);
                        }
                      },
                      child: Form(
                        child: Column(
                          children: [
                            InputEmail(hintText: "@gmail",controller: emailController),
                            SizedBox(height: 40.h),
                            BlocBuilder<FindCubit, FindState>(
                              bloc: findCubit,
                              builder: (context, state) {
                                return SubmitButton(title: "Send code", onPressButton: (){
                                  findCubit.sendOTP(emailController.text);
                                });
                              }
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 426.h),
                    Center(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Don't have any account?", style: appCubit.styles.defaultTextStyle()),
                            GestureDetector(
                              onTap: () {
                                navigate(context, SignUpScreen.route);
                              },
                              child: Text(" Sign Up", style: appCubit.styles.defaultPurpleTextStyle()),
                            )
                          ]
                      ),
                    ),
                    SizedBox(height: 112.h)
                  ],
                ))));
  }
}