import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:mobile_guys_run/commons/utils/app_colors.dart';
import 'package:mobile_guys_run/commons/utils/styles.dart';

import '../../../app/cubit/app_cubit.dart';
import '../../../modules/authenticate/signup/sign_up_screen.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final String up;
  final String down;
  final double height;
  Function()? actionUp;
  Function()? actionDown;
  CustomDialog({
    Key? key,
    required this.title,
    required this.up,
    required this.down,
    required this.height,
    this.actionUp,
    this.actionDown
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppCubit appCubit = context.read<AppCubit>();
    return
      Align(
        alignment: Alignment.bottomCenter,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(32.h),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
            child: Container(
              height: height,
              width: MediaQuery.of(context).size. width,
              decoration: BoxDecoration(
                color: AppColors.uniqueGrey.withOpacity(0.2),
                borderRadius: BorderRadius.all(Radius.circular(32.h)),
              border: Border.all(color: AppColors.forgedSteel, style:  BorderStyle.solid)),
              child: Padding(
                padding: EdgeInsets.fromLTRB(40.w, 0, 40.w, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: appCubit.styles.defaultSubTitleStyle()),
                    //const SizedBox(height: 27),
                    Center(
                      child: TextButton(onPressed: () {
                        if(actionUp == null) {
                          Navigator.pop(context);
                        }
                        else{
                          Navigator.pop(context);
                          actionUp!();
                        }

                      },
                          child: Text(up, style: appCubit.styles.defaultTextStyle())),
                    ),
                    Center(
                      child: TextButton(onPressed: () {
                        if(actionDown == null) {
                          Navigator.pop(context);
                        }
                        else{
                          Navigator.pop(context);
                          actionDown!();
                        }
                      },
                          child: Text(down, style: appCubit.styles.defaultTextStyle())),
                    )
                  ],
                ),
              )
            ),
          ),
        ),
      );
  }

}