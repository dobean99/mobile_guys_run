import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_guys_run/commons/utils/app_colors.dart';
import 'package:mobile_guys_run/commons/utils/app_images.dart';
import 'package:mobile_guys_run/commons/widgets/border/border_content.dart';
import 'package:mobile_guys_run/app/cubit/app_cubit.dart';

class AppBarChallenge extends StatelessWidget {
  const AppBarChallenge({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppCubit appCubit = context.read<AppCubit>();
    return Row(
      children: [
            BorderContent(width: 40, height: 40, widthBorder: 1, radius: 28
                , borderColor: AppColors.jasminePurple,
             child: AppImage.asset(assetPath: AppAssets.orangeShoe, width: 20, height: 20, fit: BoxFit.cover),
            ),
      const SizedBox(width: 16),
            BorderContent(width: 40, height: 40, radius: 28, widthBorder: 1,
            borderGradient: AppColors.boogerBusterToLimeAcidDown,
            child: AppImage.asset(assetPath: AppAssets.logoPlus, width: 22, height: 22, fit: BoxFit.scaleDown),),
        Expanded(child:
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text("Wednesday", style: appCubit.styles.defaultSubTitleStyle()),
              Text("2 May 22", style: appCubit.styles.defaultTextSmallOpacity())
            ],
          )
        )
      ]
    );
  }
}