import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_guys_run/app/cubit/app_cubit.dart';

import 'package:mobile_guys_run/commons/utils/app_colors.dart';

class InputText extends StatelessWidget {
  final TextEditingController? controller;
  const InputText({Key? key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppCubit appCubit = context.read<AppCubit>();
    return SizedBox(
      height: 64.h,
      child: TextFormField(
          cursorColor: AppColors.white,
          controller: controller,
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          style: appCubit.styles.defaultTextStyle(),
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(16.h)),
              borderSide: BorderSide(
                  color: AppColors.forgedSteel,
                  style: BorderStyle.solid,
                  width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(16.h)),
              borderSide: BorderSide(
                  color: AppColors.forgedSteel,
                  style: BorderStyle.solid,
                  width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(16.h)),
              borderSide: BorderSide(
                  color: AppColors.white, style: BorderStyle.solid, width: 1),
            ),
          )),
    );
  }
}
