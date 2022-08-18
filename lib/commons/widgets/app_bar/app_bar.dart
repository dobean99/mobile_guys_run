import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_guys_run/commons/utils/app_images.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_guys_run/app/cubit/app_cubit.dart';
import 'package:mobile_guys_run/modules/nav_bar_handler/nav_bar_handler.dart';
import 'package:mobile_guys_run/modules/profile/profile_setting_screen.dart';

class AppBarDetail extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool isBack;

  final bool? isSetting;

  const AppBarDetail(
      {Key? key, required this.title, required this.isBack, this.isSetting})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final NavbarNotifier navbarNotifier = NavbarNotifier();

    AppCubit appCubit = context.read<AppCubit>();
    if (isSetting == null) {
      return
          SafeArea(
            child:
            isBack == true
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: AppImage.asset(assetPath: AppAssets.icArrow
                        , width: 48.w, height: 22.h),
                  ),

                  //const Spacer(),
                  Expanded(
                    child: Text(title,
                        textAlign: TextAlign.end,
                        style: appCubit.styles.defaultTitleStyle()),
                  ),
                ],
              )
            : Text(title, style: appCubit.styles.defaultTitleStyle())
          );
    } else {
      return SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: appCubit.styles.defaultTitleStyle()),
            GestureDetector(
              onTap: () {
                navbarNotifier.hideBottomNavBar = false;
                navigate(context, ProfileSettingScreen.route,
                    isRootNavigator: false);
              },
              child: AppImage.asset(assetPath: AppAssets.setting, width: 25.w, height: 26.h),
            ),
          ],
        ),
      );
    }
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
