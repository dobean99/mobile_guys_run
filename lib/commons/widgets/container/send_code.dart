import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mobile_guys_run/commons/utils/app_colors.dart';
import 'package:mobile_guys_run/commons/utils/styles.dart';

import '../../../app/cubit/app_cubit.dart';


class Code extends StatelessWidget {
  final String label;
  const Code({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppCubit appCubit = context.read<AppCubit>();
    return
      Container(
        height: 64,
        width: MediaQuery.of(context).size. width,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.tin, style:  BorderStyle.solid),
          borderRadius: const BorderRadius.all(Radius.circular(16))
        ),
        child: Center(
            child: Text(label, style: appCubit.styles.defaultTextStyle())),
      );
  }

}