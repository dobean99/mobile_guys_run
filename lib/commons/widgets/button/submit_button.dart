import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_guys_run/commons/utils/app_colors.dart';

import 'package:mobile_guys_run/app/cubit/app_cubit.dart';



class SubmitButton extends StatelessWidget {
  final String title;
  final Function() onPressButton;
  const SubmitButton({
    Key? key,
    required this.title,
    required this.onPressButton
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppCubit appCubit = context.read<AppCubit>();
    return
      ElevatedButton(
        onPressed: () {
          onPressButton();
        },
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(28.w))),
        child: Ink(
          decoration: BoxDecoration(
              gradient:
              AppColors.buttonColor,
              borderRadius: BorderRadius.circular(28.w)),
          child: Container(
            height: 56.w,
            alignment: Alignment.center,
            child: Text(
              title,
              style:
              appCubit.styles.defaultTextStyle()
            ),
          ),
        ),
      );
  }

}