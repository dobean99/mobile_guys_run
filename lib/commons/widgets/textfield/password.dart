import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_guys_run/app/cubit/app_cubit.dart';

import 'package:mobile_guys_run/commons/utils/app_colors.dart';

class InputPassword extends StatefulWidget {
  final String hintText;

  const InputPassword({
    Key? key,
    required this.hintText,
  }) : super(key: key);

  @override
  State<InputPassword> createState() => _InputPasswordState();
}

class _InputPasswordState extends State<InputPassword> {
  late bool _passwordVisible;

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    AppCubit appCubit = context.read<AppCubit>();
    return TextFormField(
        cursorColor: AppColors.white,
        obscureText: !_passwordVisible,
        style: appCubit.styles.defaultTextStyle(),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter password';
          }
          // else if (!ValidationUtils.isValidPassword(value)) {
          //   return "Length>= 8, contain 1 [A-Z], [a-z], [0-9], special character";
          // }
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
          focusedBorder:  OutlineInputBorder(
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
          suffixIcon: IconButton(
            icon: Icon(
              // Based on passwordVisible state choose the icon
              _passwordVisible ? Icons.visibility : Icons.visibility_off,
              color: AppColors.white,
            ),
            onPressed: () {
              // Update the state i.e. toggle the state of passwordVisible variable
              setState(() {
                _passwordVisible = !_passwordVisible;
              });
            },
          ),
        ));
  }
}
