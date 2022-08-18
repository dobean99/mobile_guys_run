import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

import 'package:mobile_guys_run/app/cubit/app_cubit.dart';

class BorderContent extends StatelessWidget {
  final double width;
  final double height;
  final double radius;
  Color? backgroundColor;
  Color? borderColor;
  LinearGradient? backgroundGradient;
  LinearGradient? borderGradient;
  double? widthBorder;
  Widget? child;
  BorderContent({
    Key? key,
    required this.width,
    required this.height,
    required this.radius,
    this.widthBorder,
    this.backgroundColor,
    this.borderColor,
    this.backgroundGradient,
    this.borderGradient,
    this.child
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    dynamic background;
    dynamic color;
    AppCubit appCubit = context.read<AppCubit>();
    if(backgroundColor == null && borderColor != null && widthBorder != null) {
      return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          border: Border.all(color: borderColor!, width: widthBorder!),
          borderRadius: BorderRadius.all(Radius.circular(radius))
        ),
        child: child,
      );
    }

    else if(backgroundColor == null && borderGradient != null && widthBorder != null){
      return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(radius)),
            border: GradientBoxBorder(width: widthBorder!, gradient: borderGradient!)
            ),
        child: child,
        );
    }
    else if (backgroundColor != null) {
      if(borderColor == null){
        return Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.all(Radius.circular(radius)),
          ),
          child: child,
        );
      }
      else{
        return Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: backgroundColor,
            border: Border.all(color: borderColor!, width: widthBorder!),
            borderRadius: BorderRadius.all(Radius.circular(radius))
          ),
        );
      }
    }
    else {
      return Container();
    }

  }
}