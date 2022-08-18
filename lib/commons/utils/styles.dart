import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_guys_run/commons/utils/app_colors.dart';

class AppFontWeight {
  static const light = FontWeight.w300;
  static const regular = FontWeight.w400;
  static const bold = FontWeight.w500;
}

abstract class AppStyles {
  ThemeData? themeData;

  TextStyle? defaultTextStyle();

  TextStyle? defaultPurpleTextStyle();

  TextStyle? defaultOrangeTextStyle();

  TextStyle? defaultGradientTextStyle();

  TextStyle? defaultGreenTextStyle();

  TextStyle? defaultTextOpacity();
  TextStyle? defaultTextSmallOpacity();
  TextStyle? defaultTitleStyle();

  TextStyle? defaultSubTitleStyle();
  TextStyle? defaultSubTitleLargeStyle();
  TextStyle? defaultSubTitleLargeGreenStyle();
  //TextStyle? defaultTextFieldStyle();
  TextStyle? defaultTinTextStyle();
  TextStyle? defaultMenuStyle();
  TextStyle? defaultMenuOpacityStyle();
//TextStyle? defaultTextFieldStyle();
}

class DefaultAppStyles implements AppStyles {
  @override
  ThemeData? themeData = ThemeData(
    textSelectionTheme: TextSelectionThemeData(selectionHandleColor: AppColors.white),
    backgroundColor: AppColors.backgroundColor,
    textTheme: TextTheme(
        headline3: TextStyle(fontSize: 48.sp, fontWeight: AppFontWeight.bold),
        headline4: TextStyle(fontSize: 32.sp, fontWeight: AppFontWeight.regular),
        headline5: TextStyle(fontSize: 24.sp, fontWeight: AppFontWeight.light),
        bodyText1: TextStyle(fontSize: 14.sp, fontWeight: AppFontWeight.regular),
        bodyText2: TextStyle(fontSize: 10.sp, fontWeight: AppFontWeight.regular)),
    fontFamily: 'SVN-Gilroy',
  );

  @override
  TextStyle? defaultTextStyle() {
    return themeData?.textTheme.bodyText1?.copyWith(color: AppColors.white);
  }

  @override
  TextStyle? defaultTinTextStyle() {
    return themeData?.textTheme.bodyText2?.copyWith(color: AppColors.tin);
  }

  @override
  TextStyle? defaultPurpleTextStyle() {
    return themeData?.textTheme.bodyText1
        ?.copyWith(color: AppColors.jasminePurple);
  }

  @override
  TextStyle? defaultTitleStyle() {
    return themeData?.textTheme.headline3?.copyWith(color: AppColors.white);
  }

  @override
  TextStyle? defaultSubTitleStyle() {
    return themeData?.textTheme.headline5?.copyWith(color: AppColors.white);
  }

  @override
  TextStyle? defaultTextOpacity() {
    return themeData?.textTheme.bodyText1
        ?.copyWith(color: AppColors.white.withOpacity(0.5));
  }

  @override

  TextStyle? defaultGreenTextStyle() {
    return themeData?.textTheme.bodyText1
        ?.copyWith(color: AppColors.artyClickOceanGreen);
  }

  @override
  TextStyle? defaultOrangeTextStyle() {
    return themeData?.textTheme.bodyText1?.copyWith(color: AppColors.vitaminC);
  }

  @override
  TextStyle? defaultGradientTextStyle() {
    return themeData?.textTheme.bodyText1
        ?.copyWith(foreground: Paint()
      ..shader = AppColors.linearGradient);
  }
  @override
  TextStyle? defaultTextSmallOpacity() {
    return themeData?.textTheme.bodyText2?.copyWith(color: AppColors.white.withOpacity(0.5));
  }

  @override
  TextStyle? defaultSubTitleLargeStyle() {
    return themeData?.textTheme.headline5?.copyWith(color: AppColors.white, fontWeight: AppFontWeight.bold);
  }

  @override
  TextStyle? defaultSubTitleLargeGreenStyle() {
    return themeData?.textTheme.headline5?.copyWith(color: AppColors.artyClickOceanGreen, fontWeight: AppFontWeight.bold);
  }

  @override
  TextStyle? defaultMenuStyle() {
    return themeData?.textTheme.headline4?.copyWith(color: AppColors.white);
  }

  @override
  TextStyle? defaultMenuOpacityStyle() {
    return themeData?.textTheme.headline4?.copyWith(color: AppColors.white.withOpacity(0.5));
  }
}
