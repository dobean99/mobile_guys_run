import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_guys_run/commons/utils/app_colors.dart';
import 'package:mobile_guys_run/commons/widgets/app_bar/app_bar.dart';

import 'package:mobile_guys_run/app/cubit/app_cubit.dart';
import 'package:mobile_guys_run/commons/widgets/blur/blur_background.dart';
import 'package:mobile_guys_run/commons/widgets/border/border_content.dart';
import '../../commons/utils/app_images.dart';

import 'package:mobile_guys_run/commons/utils/app_images.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  static const String route = '/';

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with TickerProviderStateMixin {
  late AppCubit appCubit;
  late TabController tabController;
  late ValueNotifier<int> selectedIndex;

  changeIndex(int index) {
    selectedIndex.value = index;
    tabController.animateTo(index);
  }

  @override
  void initState() {
    super.initState();
    appCubit = context.read<AppCubit>();
    tabController = TabController(vsync: this, length: 2);
    selectedIndex = ValueNotifier(0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: appCubit.styles.themeData!.backgroundColor,
        //backgroundColor: Colors.white,
        body: Padding(
            padding: EdgeInsets.fromLTRB(32.w, 0, 32.w, 60.h),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppBarDetail(
                      title: "PROFILE", isBack: false, isSetting: true),
                  SizedBox(height: 28.h),
                  Stack(children: [
                    AppImage.asset(
                        assetPath: AppAssets.backdrop, width: 364.w, height: 248.h),
                    // Padding(
                    //   padding: const EdgeInsets.fromLTRB(270, 24, 0, 0),
                    //   child: BorderContent(
                    //     width: 36,
                    //     height: 36,
                    //     radius: 18,
                    //     backgroundColor:
                    //         AppColors.lightSilver.withOpacity(0.5),
                    //     child: AppImage.asset(
                    //         assetPath: AppAssets.pen, fit: BoxFit.scaleDown),
                    //   ),
                    // ),
                    Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Stack(
                          children: [
                            BlurBackground(
                              sigmaX: 20,
                              sigmaY: 20,
                              child: BorderContent(
                                width: 364.w,
                                height: 104.h,
                                radius: 32.h,
                                widthBorder: 1,
                                borderColor: AppColors.forgedSteel,
                                backgroundColor:
                                    AppColors.uniqueGrey.withOpacity(0.2),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.fromLTRB(24.w, 24.h, 0, 0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  AppImage.asset(
                                      assetPath: AppAssets.avatar,
                                      width: 56.h,
                                      height: 56.h,
                                      fit: BoxFit.scaleDown),
                                  SizedBox(width: 16.w),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Daisy",
                                          style: appCubit.styles
                                              .defaultSubTitleStyle()),
                                      SizedBox(height: 4.h),
                                      Text("daisybty@gmail.com",
                                          style: appCubit.styles
                                              .defaultTextStyle())
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ))
                  ]),
                  SizedBox(height: 38.h),
                  ValueListenableBuilder(
                      valueListenable: selectedIndex,
                      builder: (context, _, child) {
                        return DefaultTabController(
                            length: 2, // length of tabs
                            initialIndex: 0,
                            child: Column(children: [
                              TabBar(
                                  controller: tabController,
                                  onTap: (int index) {
                                    changeIndex(index);
                                  },
                                  tabs: const [
                                    Tab(text: "MY SHOES"),
                                    Tab(text: "HISTORY"),
                                  ],
                                  isScrollable: true,
                                  //labelPadding: const EdgeInsets.fromLTRB(0, 0, 46, 0),
                                  labelStyle:
                                      appCubit.styles.defaultMenuStyle(),
                                  indicatorColor: Colors.transparent,
                                  unselectedLabelStyle: appCubit.styles
                                      .defaultMenuOpacityStyle()),
                              SizedBox(
                                height: 32.h,
                              ),
                              IndexedStack(
                                index: selectedIndex.value,
                                children: [
                                  Visibility(
                                    maintainState: true,
                                    visible: selectedIndex.value == 0,
                                    child: Column(
                                      children: [
                                        Stack(
                                          children: [
                                            BorderContent(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: 128.h,
                                              radius: 16.h,
                                              widthBorder: 1,
                                              borderColor:
                                                  AppColors.forgedSteel,
                                              backgroundColor: AppColors
                                                  .uniqueGrey
                                                  .withOpacity(0.2),
                                            ),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  flex: 4,
                                                  child: Padding(
                                                    padding: EdgeInsets.fromLTRB(0, 24.h, 0, 24.h),
                                                    child: AppImage.asset(
                                                        assetPath: AppAssets
                                                            .orangeShoe,
                                                        width: 122.w,
                                                        height: 78.h,
                                                        fit: BoxFit.cover),
                                                  ),
                                                ),
                                                //const SizedBox(width: 14),
                                                Expanded(
                                                  flex: 3,
                                                  child: Padding(
                                                    padding: EdgeInsets.fromLTRB(0, 18.h, 0, 0),
                                                    child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                              "Guy Air Froce sneaker 01",
                                                              style: appCubit
                                                                  .styles
                                                                  .defaultTextStyle()),
                                                          Text("6.7 kms",
                                                              style: appCubit
                                                                  .styles
                                                                  .defaultSubTitleLargeStyle()),
                                                          Text("Total Distance",
                                                              style: appCubit
                                                                  .styles
                                                                  .defaultTextSmallOpacity()),
                                                        ]),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: Padding(
                                                    padding: EdgeInsets.fromLTRB(0, 18.h, 0, 0),
                                                    child: Stack(
                                                      children: [
                                                        BorderContent(
                                                            width: 36.h,
                                                            height: 36.h,
                                                            radius: 18.h,
                                                            backgroundColor:
                                                                AppColors
                                                                    .uniqueGrey
                                                                    .withOpacity(
                                                                        0.2),
                                                            child: AppImage.asset(
                                                                assetPath:
                                                                    AppAssets
                                                                        .delete,
                                                                fit: BoxFit
                                                                    .scaleDown)),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(width: 18.w),
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 16.h),
                                        Stack(
                                          children: [
                                            BorderContent(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: 128.h,
                                              radius: 16.h,
                                              widthBorder: 1,
                                              borderColor: AppColors.forgedSteel,
                                            ),
                                            Row(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  flex: 4,
                                                  child: Padding(
                                                    padding: EdgeInsets.fromLTRB(0, 24.h, 0, 24.h),
                                                    child: AppImage.asset(
                                                        assetPath: AppAssets
                                                            .blueShoe,
                                                        width: 122.w,
                                                        height: 78.h,
                                                        fit: BoxFit.cover),
                                                  ),
                                                ),
                                                //const SizedBox(width: 14),
                                                Expanded(
                                                  flex: 3,
                                                  child: Padding(
                                                    padding: EdgeInsets.fromLTRB(0, 18.h, 0, 0),
                                                    child: Column(
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                        children: [
                                                          Text(
                                                              "Guy Air Froce sneaker 02",
                                                              style: appCubit
                                                                  .styles
                                                                  .defaultTextStyle()),
                                                          Text("6.7 kms",
                                                              style: appCubit
                                                                  .styles
                                                                  .defaultSubTitleLargeStyle()),
                                                          Text("Total Distance",
                                                              style: appCubit
                                                                  .styles
                                                                  .defaultTextSmallOpacity()),
                                                        ]),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: Padding(
                                                    padding: EdgeInsets.fromLTRB(0, 18.h, 0, 0),
                                                    child: Stack(
                                                      children: [
                                                        BorderContent(
                                                            width: 36.h,
                                                            height: 36.h,
                                                            radius: 18.h,
                                                            backgroundColor:
                                                            AppColors
                                                                .uniqueGrey
                                                                .withOpacity(
                                                                0.2),
                                                            child: AppImage.asset(
                                                                assetPath:
                                                                AppAssets
                                                                    .delete,
                                                                fit: BoxFit
                                                                    .scaleDown)),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(width: 18.w),
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 40.h),
                                        Center(
                                            child: BorderContent(
                                                width: 40.h,
                                                height: 40.h,
                                                radius: 20.h,
                                                backgroundColor: AppColors
                                                    .artyClickOceanGreen,
                                                child: AppImage.asset(
                                                    assetPath: AppAssets.add,
                                                    fit: BoxFit.scaleDown)))
                                      ],
                                    ),
                                  ),
                                  Visibility(
                                    maintainState: true,
                                    visible: selectedIndex.value == 1,
                                    child: Column(
                                      children: [
                                        HistoryRecord(
                                            dateTime: "Yesterday",
                                            distance: "6.7",
                                            kcal: "612",
                                            earn: "6284"),
                                        SizedBox(height: 16.h),
                                        HistoryRecord(
                                            dateTime: "10 May",
                                            distance: "5.2",
                                            kcal: "468",
                                            earn: "4826"),
                                        SizedBox(height: 16.h),
                                        HistoryRecord(
                                            dateTime: "8 May",
                                            distance: "6.2",
                                            kcal: "582",
                                            earn: "5928")
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: 50.h)
                            ]));
                      }),
                ],
              ),
            )));
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
}

class HistoryRecord extends StatelessWidget {
  final String dateTime;
  final String distance;
  final String kcal;
  final String earn;

  const HistoryRecord({
    Key? key,
    required this.dateTime,
    required this.distance,
    required this.kcal,
    required this.earn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppCubit appCubit = context.read<AppCubit>();
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: Stack(
              children: [
                AppImage.asset(
                    assetPath: AppAssets.logoBackground, width: 88.h, height: 88.h),
                Padding(
                  padding: EdgeInsets.all(27.h),
                  child: AppImage.asset(
                      assetPath: AppAssets.icLogo, width: 35.w, height: 32.h),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    dateTime,
                    style: appCubit.styles.defaultTextStyle(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '$distance kms',
                            style: appCubit.styles.defaultSubTitleStyle(),
                          ),
                          Text(
                            'Distance',
                            style: appCubit.styles.defaultTextSmallOpacity(),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            kcal,
                            style: appCubit.styles.defaultSubTitleStyle(),
                          ),
                          Text(
                            'Kcal',
                            style: appCubit.styles.defaultTextSmallOpacity(),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            earn,
                            style: appCubit.styles.defaultSubTitleStyle(),
                          ),
                          Text(
                            'Earn',
                            style: appCubit.styles.defaultTextSmallOpacity(),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
