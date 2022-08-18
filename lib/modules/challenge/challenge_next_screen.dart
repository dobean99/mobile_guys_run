import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/src/foundation/change_notifier.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_guys_run/commons/utils/app_colors.dart';
import 'package:mobile_guys_run/commons/widgets/app_bar/app_bar.dart';

import 'package:mobile_guys_run/app/cubit/app_cubit.dart';
import 'package:mobile_guys_run/commons/widgets/app_bar/app_bar_challenge.dart';
import 'package:mobile_guys_run/commons/widgets/border/border_content.dart';

import '../../commons/utils/app_images.dart';

class ChallengeNextScreen extends StatefulWidget {
  const ChallengeNextScreen({Key? key}) : super(key: key);
  static const String route = '/challenge';

  @override
  State<ChallengeNextScreen> createState() => _ChallengeNextScreenState();
}

class _ChallengeNextScreenState extends State<ChallengeNextScreen> {
  late AppCubit appCubit;
  late ValueNotifier<bool> isPlay;
  Duration duration = const Duration();
  Timer? timer;

  void addTime() {
    const addSeconds = 1;
    setState(() {
      final seconds = duration.inSeconds + addSeconds;
      duration = Duration(seconds: seconds);
    });
  }

  void startTime() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) => addTime());
  }

  void stopTimer() {
    if (isPlay.value == false) {
      setState(() {
        timer?.cancel();
      });
    }
  }

  updatePlay() {
    if (isPlay.value == true) {
      isPlay.value = false;
    } else {
      isPlay.value = true;
    }
  }

  @override
  void initState() {
    super.initState();
    appCubit = context.read<AppCubit>();
    isPlay = ValueNotifier(false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appCubit.styles.themeData!.backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(32.w, 0, 32.w, 60.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppBarDetail(title: "CHALLENGES", isBack: false),
              SizedBox(height: 28.h),
              const AppBarChallenge(),
              SizedBox(height: 16.h),
              BorderContent(
                height: 130.h,
                width: MediaQuery.of(context).size.width,
                radius: 32.h,
                widthBorder: 1,
                borderColor: AppColors.artyClickOceanGreen,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(24.w, 24.h, 24.w, 24.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppImage.asset(
                          assetPath: AppAssets.avatar,
                          width: 72.h,
                          height: 72.h,
                          fit: BoxFit.scaleDown),
                      SizedBox(width: 16.h),
                      Expanded(
                          child: Text(
                        "CHALLENGES RUNNING RECORDS",
                        style: appCubit.styles.defaultSubTitleStyle(),
                      ))
                    ],
                  ),
                ),
              ),
              SizedBox(height: 35.h),
              Center(
                child: Column(
                  children: [
                    Text("Distance",
                        style: appCubit.styles.defaultTextSmallOpacity()),
                    SizedBox(height: 7.h),
                    RichText(
                      text: TextSpan(
                          style: appCubit.styles.defaultSubTitleLargeStyle(),
                          children: [
                            TextSpan(
                                text: '0.2 kms',
                                style: appCubit.styles
                                    .defaultSubTitleLargeGreenStyle()),
                            const TextSpan(text: ' / 10 kms')
                          ]),
                    ),
                    SizedBox(height: 32.h),
                    Text("Kcal",
                        style: appCubit.styles.defaultTextSmallOpacity()),
                    SizedBox(height: 7.h),
                    RichText(
                      text: TextSpan(
                          style: appCubit.styles.defaultSubTitleLargeStyle(),
                          children: [
                            TextSpan(
                                text: '36 kcal',
                                style: appCubit.styles
                                    .defaultSubTitleLargeGreenStyle()),
                            const TextSpan(text: ' / 860 kcal')
                          ]),
                    ),
                    SizedBox(height: 32.h),
                    Text("Earn",
                        style: appCubit.styles.defaultTextSmallOpacity()),
                    SizedBox(height: 7.h),
                    RichText(
                      text: TextSpan(
                          style: appCubit.styles.defaultSubTitleLargeStyle(),
                          children: [
                            TextSpan(
                                text: '600 token',
                                style: appCubit.styles
                                    .defaultSubTitleLargeGreenStyle()),
                            const TextSpan(text: ' / 9800 token')
                          ]),
                    ),
                    SizedBox(height: 72.h),
                    Text("Run",
                        style: appCubit.styles.defaultTextSmallOpacity()),
                    SizedBox(height: 7.h),
                    buildTime(),
                    SizedBox(height: 37.h),
                    ValueListenableBuilder(
                        valueListenable: isPlay,
                        builder: (context, _, child) {
                          return GestureDetector(
                            onTap: () {
                              updatePlay();
                              isPlay.value == true ? startTime() : stopTimer();
                            },
                            child: isPlay.value == false
                                ? BorderContent(
                                    width: 36,
                                    height: 36,
                                    radius: 18,
                                    backgroundColor:
                                        AppColors.uniqueGrey.withOpacity(0.2),
                                    child: AppImage.asset(
                                        assetPath: AppAssets.pause,
                                        width: 24,
                                        height: 24,
                                        fit: BoxFit.scaleDown),
                                  )
                                : BorderContent(
                                    width: 36,
                                    height: 36,
                                    radius: 18,
                                    backgroundColor:
                                        AppColors.uniqueGrey.withOpacity(0.2),
                                    child: AppImage.asset(
                                        assetPath: AppAssets.play,
                                        width: 24,
                                        height: 24,
                                        fit: BoxFit.scaleDown),
                                  ),
                          );
                        }),
                  ],
                ),
              ),
              SizedBox(height: 50.h)
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTime() {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final hours = twoDigits(duration.inHours.remainder(60));
    return Text('$hours:$minutes:$seconds',
        style: appCubit.styles.defaultSubTitleLargeGreenStyle());
  }
}
