import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_guys_run/app/cubit/app_cubit.dart';

import 'package:mobile_guys_run/commons/utils/app_colors.dart';
import 'package:mobile_guys_run/commons/utils/validation_utils.dart';
import 'package:mobile_guys_run/modules/authenticate/signin/cubit/sign_in_cubit.dart';

class InputEmail extends StatefulWidget {
  final String hintText;
  final TextEditingController? controller;
  final Function(String value)? onChange;
  const InputEmail(
      {Key? key, required this.hintText, this.controller, this.onChange})
      : super(key: key);

  @override
  State<InputEmail> createState() => _InputEmailState();
}

class _InputEmailState extends State<InputEmail> {
  late SignInCubit signInCubit;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppCubit appCubit = context.read<AppCubit>();
    return TextFormField(
        cursorColor: AppColors.white,
        controller: widget.controller,
        //onChanged: (value) => onChange!(value),
        style: appCubit.styles.defaultTextStyle(),
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter email';
          } else if (!ValidationUtils.isValidEmail(value)) {
            return "Wrong format email";
          }
          return null;
        },
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          border: OutlineInputBorder(
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
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16.h)),
            borderSide: BorderSide(
                color: AppColors.forgedSteel,
                style: BorderStyle.solid,
                width: 1),
          ),
          hintText: widget.hintText,
          hintStyle: appCubit.styles.defaultTextOpacity(),
        ));
  }
}
