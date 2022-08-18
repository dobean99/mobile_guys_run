import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_guys_run/commons/utils/app_colors.dart';

import '../../utils/app_images.dart';

class AppBarCommon extends StatelessWidget implements PreferredSizeWidget {
  const AppBarCommon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        leadingWidth: 100.w,
        leading: AppImage.asset(assetPath: AppAssets.icLogo, width: 32.h, height: 35.h, fit: BoxFit.none)
      ,backgroundColor: AppColors.backgroundColor,);
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
