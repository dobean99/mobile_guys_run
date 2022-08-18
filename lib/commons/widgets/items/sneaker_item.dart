import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_guys_run/app/cubit/app_cubit.dart';
import 'package:mobile_guys_run/commons/utils/app_colors.dart';
import 'package:mobile_guys_run/commons/utils/app_images.dart';
import 'package:mobile_guys_run/modules/nav_bar_handler/models/sneaker.dart';

class SneakerItem extends StatelessWidget {
  final Sneaker sneaker;

  const SneakerItem({
    Key? key,
    required this.sneaker,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppCubit appCubit = context.read<AppCubit>();

    return Container(
        // height: MediaQuery.of(context).size.width * 0.7,
        // width: MediaQuery.of(context).size.width * 0.4,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16.r)),
          border: Border.all(
            color: AppColors.white,
          ),
        ),
        child: Padding(
          padding:  EdgeInsets.fromLTRB(8.w, 15.h, 8.w, 8.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '#42697',
                style: appCubit.styles.defaultTextStyle(),
              ),
              Center(
                child: Column(
                  children: [
                    SizedBox(
                        child: AppImage.asset(assetPath: AppAssets.legendary)),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius:
                             BorderRadius.all(Radius.circular(16.r)),
                        border: Border.all(
                          color: AppColors.white,
                        ),
                        gradient: AppColors.seaGreenToLightBlue,
                      ),
                      child: Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 10.w,vertical: 4.h),
                        child: Text(
                          'Legendary',
                          style: appCubit.styles.defaultTextStyle(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding:  EdgeInsets.all(4.0.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          '46',
                          style: appCubit.styles.defaultTextStyle(),
                        ),
                        Text(
                          '0/6',
                          style: appCubit.styles.defaultTextStyle(),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.all(4.0.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '46',
                          style: appCubit.styles.defaultTextStyle(),
                        ),
                        Text(
                          '0/6',
                          style: appCubit.styles.defaultTextStyle(),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const Divider(
                color: AppColors.white,
              ),
              Text(
                'Filter',
                style: appCubit.styles.defaultSubTitleStyle(),
              ),
              Text(
                'Last 24h rewards up to 20',
                style: appCubit.styles.defaultTinTextStyle(),
              ),
            ],
          ),
        ));
  }
}
