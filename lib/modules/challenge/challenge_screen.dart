import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_guys_run/commons/utils/app_colors.dart';

import 'package:mobile_guys_run/app/cubit/app_cubit.dart';
import 'package:mobile_guys_run/commons/widgets/app_bar/app_bar_challenge.dart';
import 'package:mobile_guys_run/commons/widgets/border/border_content.dart';
import 'package:mobile_guys_run/commons/widgets/button/submit_button.dart';
import 'package:mobile_guys_run/modules/challenge/challenge_next_screen.dart';
import 'package:mobile_guys_run/modules/nav_bar_handler/nav_bar_handler.dart';

import '../../commons/utils/app_images.dart';
import '../../commons/widgets/app_bar/app_bar.dart';

class ChallengeScreen extends StatefulWidget {
  const ChallengeScreen({Key? key}) : super(key: key);
  static const String route = '/';

  @override
  State<ChallengeScreen> createState() => _ChallengeScreenState();
}

class _ChallengeScreenState extends State<ChallengeScreen> {
  late AppCubit appCubit;
  final NavbarNotifier _navbarNotifier = NavbarNotifier();

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
              AppBarDetail(title: "CHALLENGES", isBack: false),
              SizedBox(height: 28.h),
              const AppBarChallenge(),
              SizedBox(height: 16.h),
              BorderContent(
                  width: MediaQuery.of(context).size.width,
                  height: 670.h,
                  radius: 32.h,
                  widthBorder: 1,
                  borderColor: AppColors.forgedSteel,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(24.w, 24.h, 24.w, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppImage.asset(
                                assetPath: AppAssets.avatar,
                                width: 72.h,
                                height: 72.h,
                                fit: BoxFit.scaleDown),
                            SizedBox(width: 16.w),
                            Flexible(
                                child: Text(
                              "CHALLENGES RUNNING RECORDS",
                              style: appCubit.styles.defaultSubTitleStyle(),
                            ))
                          ],
                        ),
                        SizedBox(height: 34.h),
                        Text("Today Targets",
                            style: appCubit.styles.defaultTextStyle()),
                        SizedBox(height: 9.h),
                        Row(
                          children: [
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("10 kms",
                                      style: appCubit.styles
                                          .defaultSubTitleLargeStyle()),
                                  Text("Distance",
                                      style: appCubit.styles
                                          .defaultTextSmallOpacity()),
                                ]),
                            SizedBox(width: 25.h),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("860",
                                      style: appCubit.styles
                                          .defaultSubTitleLargeStyle()),
                                  Text("Kcal",
                                      style: appCubit.styles
                                          .defaultTextSmallOpacity()),
                                ]),
                            SizedBox(width: 25.w),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("9800",
                                      style: appCubit.styles
                                          .defaultSubTitleLargeStyle()),
                                  Text("Earn",
                                      style: appCubit.styles
                                          .defaultTextSmallOpacity()),
                                ])
                          ],
                        ),
                        SizedBox(height: 30.h),
                        Text("SOLO MODE",
                            style: appCubit.styles.defaultSubTitleStyle()),
                        SizedBox(height: 4.h),
                        Column(
                          children: [
                            Text(
                              "In solo mode, to earn tokens, users need to run/walk with NFTs of sneakers.\nSpecifically, the GUYS is 0 by default when the user get a sneaker, and users can get KMT rewards by running/walking and consuming mileage values.\nThe daily mileage value cap depends on the number of and rarity of the sneakers owned by users. Users can buy more and rarer sneakers to increase the mileage value.",
                              style: appCubit.styles.defaultTextStyle(),
                            )
                          ],
                        ),
                        SizedBox(height: 54.h),
                        Expanded(
                          child: Center(
                            child: SubmitButton(
                                title: "Start",
                                onPressButton: () {
                                  _navbarNotifier.hideBottomNavBar = false;
                                  navigate(context, ChallengeNextScreen.route,
                                      isRootNavigator: false);
                                }),
                          ),
                        )
                      ],
                    ),
                  )),
              SizedBox(height: 100.h)
            ],
          ),
        ),
      ),
    );
  }
}
