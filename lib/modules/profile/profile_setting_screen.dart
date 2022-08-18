import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_guys_run/commons/utils/app_colors.dart';
import 'package:mobile_guys_run/commons/utils/app_images.dart';
import 'package:mobile_guys_run/commons/widgets/app_bar/app_bar.dart';

import 'package:mobile_guys_run/app/cubit/app_cubit.dart';
import 'package:mobile_guys_run/commons/widgets/border/border_content.dart';
import 'package:mobile_guys_run/modules/authenticate/changeemail/change_email_screen.dart';
import 'package:mobile_guys_run/modules/authenticate/changepass/change_password_screen.dart';
import 'package:mobile_guys_run/modules/nav_bar_handler/nav_bar_handler.dart';

import 'package:mobile_guys_run/commons/widgets/blur/blur_background.dart';
import 'package:mobile_guys_run/commons/widgets/dialog/dialog.dart';
import 'package:mobile_guys_run/modules/nav_bar_handler/nav_bar_handler.dart';

class ProfileSettingScreen extends StatefulWidget {
  const ProfileSettingScreen({Key? key}) : super(key: key);
  static const String route = '/profile/setting';
  static const String settingPass = '/profile/setting/password';
  static const String settingEmail = '/profile/setting/email';

  @override
  State<ProfileSettingScreen> createState() => _ProfileSettingScreenState();
}

class _ProfileSettingScreenState extends State<ProfileSettingScreen>
    with TickerProviderStateMixin {
  late AppCubit appCubit;
  File? backdrop;

  @override
  void initState() {
    super.initState();
    appCubit = context.read<AppCubit>();
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
                  const AppBarDetail(title: "PROFILE", isBack: true),
                  SizedBox(height: 28.h),
                  Stack(
                    children: [
                      Container(
                        width: 364.w,
                        height: 248.w,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                              image: backdrop != null
                                  ? FileImage(
                                      File(backdrop!.path),
                                    )
                                  : const AssetImage(AppAssets.backdrop)
                                      as ImageProvider),
                          borderRadius: BorderRadius.all(Radius.circular(32.h)),
                          border: Border.all(
                            color: AppColors.tin,
                          ),
                        ),
                      ),
                      Positioned.fill(
                        bottom: 70.h,
                        child: Align(
                          alignment: Alignment.center,
                          child: BlurBackground(
                            sigmaX: 1,
                            sigmaY: 1,
                            child: BorderContent(
                              width: 36,
                              height: 36,
                              radius: 18,
                              backgroundColor:
                                  AppColors.lightSilver.withOpacity(0.5),
                              child: GestureDetector(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Padding(
                                          padding: EdgeInsets.fromLTRB(
                                              32.w, 0, 32.w, 62.h),
                                          child: CustomDialog(
                                            title: "Change background:",
                                            up: "Take photo",
                                            down: "Choose from library",
                                            height: 178.w,
                                            actionUp: _getFromCamera,
                                            actionDown: _getFromGallery,
                                          ),
                                        );
                                      });
                                },
                                child: AppImage.asset(
                                    assetPath: AppAssets.pen,
                                    width: 12,
                                    height: 12,
                                    fit: BoxFit.scaleDown),
                              ),
                            ),
                          ),
                        ),
                      ),
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
                                )),
                            Positioned.fill(
                              child: Align(
                                alignment: Alignment.center,
                                child: Stack(
                                  children: [
                                    AppImage.asset(
                                        assetPath: AppAssets.avatar,
                                        width: 72.h,
                                        height: 72.h,
                                        fit: BoxFit.scaleDown),
                                    Positioned.fill(
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: BlurBackground(
                                          sigmaX: 1,
                                          sigmaY: 1,
                                          child: BorderContent(
                                            width: 36,
                                            height: 36,
                                            radius: 18.h,
                                            backgroundColor: AppColors
                                                .lightSilver
                                                .withOpacity(0.5),
                                            child: GestureDetector(
                                              onTap: () {
                                                showDialog(
                                                    context: context,
                                                    builder:
                                                        (BuildContext context) {
                                                      return Padding(
                                                        padding:
                                                            EdgeInsets.fromLTRB(
                                                                32.w,
                                                                0,
                                                                32.w,
                                                                62.h),
                                                        child: CustomDialog(
                                                            title:
                                                                "Change profile photo:",
                                                            up: "Take photo",
                                                            down:
                                                                "Choose from library",
                                                            height: 178.w),
                                                      );
                                                    });
                                              },
                                              child: AppImage.asset(
                                                  assetPath: AppAssets.pen,
                                                  fit: BoxFit.scaleDown),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 17.h),
                  Container(
                    //margin: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(32.h)),
                      border: Border.all(
                        color: AppColors.tin,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(25.h),
                      child: Column(
                        children: [
                          ListTileCustom(
                            title: 'Name',
                            value: 'Daisy',
                            onTap: () {},
                          ),
                          ListTileCustom(
                            title: 'Email',
                            value: 'daisybty@gmail.com',
                            icon: Icons.arrow_forward_ios_outlined,
                            onTap: () {
                              navigate(context, ChangeEmailScreen.route);
                            },
                          ),
                          ListTileCustom(
                            title: 'Password',
                            value: 'Set',
                            icon: Icons.arrow_forward_ios_outlined,
                            onTap: () {
                              navigate(
                                context,
                                ChangePassScreen.route,
                              );
                            },
                          ),
                          ListTileCustom(
                            title: 'Sound',
                            value: 'On',
                            icon: Icons.arrow_forward_ios_outlined,
                            customDialog: CustomDialog(
                                title: "Sound :",
                                up: "On",
                                down: "Off",
                                height: 178.w),
                          ),
                          ListTileCustom(
                            title: 'Language',
                            value: 'English',
                            icon: Icons.arrow_forward_ios_outlined,
                            customDialog: CustomDialog(
                                title: "Language :",
                                up: "English",
                                down: "Japan",
                                height: 178.w),
                          ),
                          ListTileCustom(
                            title: 'Version',
                            value: '1.0.1',
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(32.h)),
                      border: Border.all(
                        color: AppColors.white,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 18.h),
                      child: Center(
                        child: Text(
                          'Log out',
                          style: appCubit.styles.defaultTextStyle(),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 40.h)
                ],
              ),
            )));
  }

  _getFromCamera() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image == null) return;
    final imageTemp = File(image.path);
    setState(() => backdrop = imageTemp);
  }

  _getFromGallery() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    final imageTemp = File(image.path);
    setState(() => backdrop = imageTemp);
  }
}

class ListTileCustom extends StatelessWidget {
  final String title;
  final String value;
  final Function()? onTap;
  final IconData? icon;
  final Widget? customDialog;

  const ListTileCustom(
      {Key? key,
      required this.title,
      required this.value,
      this.onTap,
      this.icon,
      this.customDialog})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppCubit appCubit = context.read<AppCubit>();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: appCubit.styles.defaultTextStyle(),
          ),
          GestureDetector(
            //custom dialog
            onTap: () {
              customDialog != null
                  ? showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Padding(
                            padding: EdgeInsets.fromLTRB(32.w, 0, 32.w, 62.h),
                            child: customDialog);
                      })
                  : onTap!();
            },
            child: Row(
              children: [
                Text(
                  value,
                  style: appCubit.styles.defaultTextOpacity(),
                ),
                const SizedBox(
                  width: 2,
                ),
                icon != null
                    ? const Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 6,
                        color: AppColors.tin,
                      )
                    : const SizedBox(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
