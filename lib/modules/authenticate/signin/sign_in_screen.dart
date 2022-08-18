import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_guys_run/commons/widgets/button/submit_button.dart';
import 'package:mobile_guys_run/commons/widgets/app_bar/app_bar.dart';
import 'package:mobile_guys_run/commons/widgets/app_bar/app_bar_common.dart';
import 'package:mobile_guys_run/commons/widgets/textfield/password.dart';
import 'package:mobile_guys_run/commons/widgets/textfield/email.dart';
import 'package:mobile_guys_run/app/cubit/app_cubit.dart';
import 'package:mobile_guys_run/modules/authenticate/signin/cubit/sign_in_cubit.dart';
import 'package:mobile_guys_run/modules/authenticate/signup/sign_up_screen.dart';
import 'package:mobile_guys_run/modules/nav_bar_handler/nav_bar_handler.dart';
import 'package:mobile_guys_run/repository/authentication_repository.dart';

import '../../../commons/widgets/dialog/dialog.dart';
import '../find/find_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);
  static const String route = '/sign_in';

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late AppCubit appCubit;
  late SignInCubit sigInCubit;
  late AuthenticationRepository authenticationRepository;

  void navigate() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const NavBarHandler()));
  }

  void navigateForgot() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const FindScreen()));
  }

  void navigateSignUp() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const SignUpScreen()));
  }

  void navigateHome() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const NavBarHandler()));
  }

  @override
  void initState() {
    super.initState();
    appCubit = context.read<AppCubit>();
    authenticationRepository = context.read<AuthenticationRepository>();
    sigInCubit = SignInCubit(authenticationRepository);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sigInCubit,
      child: BlocListener<SignInCubit, SignInState>(
        listener: (context, state) {
          if (state is SignInFail) {
            Fluttertoast.showToast(msg: state.error);
          }
        },
        child: Scaffold(
          appBar: const AppBarCommon(),
          backgroundColor: appCubit.styles.themeData!.backgroundColor,
          body: Padding(
            padding: EdgeInsets.fromLTRB(32.w, 10.h, 32.h, 0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //const AppBarCommon(),
                  SizedBox(height: 42.h),
                  const AppBarDetail(title: "SIGN IN", isBack: false),
                  SizedBox(height: 28.h),
                  const InputEmail(hintText: "@gmail"),
                  SizedBox(height: 16.h),
                  const InputPassword(hintText: "Password"),
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
                  SizedBox(height: 224.h),
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
                                      child: CustomDialog(
                                        title: "Forgotten password?",
                                        up: "Yes",
                                        down: "Continue to register",
                                        height: 178.w,
                                        actionUp: navigateForgot,
                                        actionDown: navigateSignUp,
                                      ));
                                });
                          },
                          child: Text(
                            "Forgotten password?",
                            style: appCubit.styles.defaultPurpleTextStyle(),
                          ),
                        ),
                        SizedBox(height: 28.h),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Don't have any account?",
                                  style: appCubit.styles.defaultTextStyle()),
                              GestureDetector(
                                onTap: navigateSignUp,
                                child: Text(" Sign Up",
                                    style: appCubit.styles
                                        .defaultPurpleTextStyle()),
                              )
                            ]),
                      ],
                    ),
                  ),
                  SizedBox(height: 112.h)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
