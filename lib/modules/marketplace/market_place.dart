import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_guys_run/app/cubit/app_cubit.dart';
import 'package:mobile_guys_run/commons/utils/app_colors.dart';
import 'package:mobile_guys_run/commons/widgets/app_bar/app_bar.dart';
import 'package:mobile_guys_run/commons/widgets/dropdown/dropdown.dart';
import 'package:mobile_guys_run/commons/widgets/items/sneaker_item.dart';
import 'package:mobile_guys_run/modules/nav_bar_handler/models/sneaker.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MarketPlace extends StatefulWidget {
  const MarketPlace({Key? key}) : super(key: key);
  static const String route = '/';

  @override
  State<MarketPlace> createState() => _MarketPlaceState();
}

class _MarketPlaceState extends State<MarketPlace> {
  late AppCubit appCubit;
  late List<Sneaker> sneakers = [
    Sneaker(),
    Sneaker(),
    Sneaker(),
    Sneaker(),
    Sneaker(),
  ];
  final List<String> items = [
    'Latest list',
    'Lowest price',
    'Highest price',
  ];
  late String selectedValue;
  late ScrollController _scrollControl;

  @override
  void initState() {
    super.initState();
    appCubit = context.read<AppCubit>();
    selectedValue = items[0];
    _scrollControl = ScrollController();
  }

  @override
  void dispose() {
    _scrollControl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
   // var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    // final double itemHeight = (size.height - kToolbarHeight - 24)/2;
    // final double itemWidth = size.width / 2;
    return Scaffold(
      backgroundColor: appCubit.styles.themeData!.backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(32.w, 0, 32.h, 90.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppBarDetail(title: "MARKETPLACE", isBack: false),
              GestureDetector(
                onTap: _showMaterialDialog,
                child: Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(16.r)),
                      border: Border.all(
                        color: AppColors.white,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 12.w, vertical: 8.h),
                      child: Text(
                        'Filter (0)',
                        style: appCubit.styles.defaultTextStyle(),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 34.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${sneakers.length} Characters",
                      style: appCubit.styles.defaultSubTitleStyle(),
                    ),
                    Dropdown(
                      items: items,
                      selectedValue: selectedValue,
                      onChanged: (value) {
                        setState(() {
                          selectedValue = value as String;
                        });
                      },
                    ),
                  ],
                ),
              ),
              GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                childAspectRatio: 0.5,
                shrinkWrap: true,
                crossAxisCount: 2,
                crossAxisSpacing: 16.w,
                mainAxisSpacing: 16.h,
                children: _renderListItem(sneakers),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showMaterialDialog() {
    showDialog(
        context: context,
        barrierColor: Colors.transparent,
        useSafeArea: true,
        anchorPoint: const Offset(0, 20),
        builder: (context) {
          return Dialog(
            alignment: Alignment.centerRight,
            backgroundColor: Colors.transparent,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.tin.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(color: AppColors.forgedSteel),
                  ),
                  height: MediaQuery.of(context).size.height * 0.75,
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 24.w, top: 18.h, bottom: 24.h, right: 24.w),
                    child: SingleChildScrollView(
                      // interactive: true,
                      // controller: _scrollControl,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: TextButton(
                              onPressed: () {},
                              child: Text(
                                'Clear all',
                                style: appCubit.styles.defaultPurpleTextStyle(),
                              ),
                            ),
                          ),
                          const Filter(title: 'Price (USDC)'),
                          const RarityCheckBox(),
                          const Filter(title: 'Talent'),
                          const Filter(title: 'Level'),
                          const Filter(title: 'Invites done'),
                          const Filter(title: 'Learning Speed'),
                          // Slider(
                          //   value: val,
                          //   max: 100,
                          //   label: val.round().toString(),
                          //   onChanged: (value) {
                          //     setState(() {
                          //       val = value;
                          //     });
                          //   },
                          //   activeColor: AppColors.artyClickOceanGreen,
                          // )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }

  _renderListItem(List<Sneaker> sneakers) {
    return List.generate(
        sneakers.length, (index) => SneakerItem(sneaker: sneakers[index]));
  }
}

class RarityCheckBox extends StatefulWidget {
  const RarityCheckBox({
    Key? key,
  }) : super(key: key);

  @override
  State<RarityCheckBox> createState() => _RarityCheckBoxState();
}

class _RarityCheckBoxState extends State<RarityCheckBox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    AppCubit appCubit = context.read<AppCubit>();
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 9.h),
            child: Text(
              'Rarity',
              style: appCubit.styles.defaultTextStyle(),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Transform.scale(
                    scale: 1.5,
                    child: Checkbox(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5.r))),
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value!;
                        });
                      },
                      value: isChecked,
                      side: MaterialStateBorderSide.resolveWith(
                        (states) => const BorderSide(
                            width: 1.0, color: AppColors.white),
                      ),
                      activeColor: Colors.transparent,
                      //activeColor: AppColors.white,
                    ),
                  ),
                  Text(
                    'Uncommon',
                    style: appCubit.styles.defaultGreenTextStyle(),
                  ),
                  // Container(
                  //   decoration: BoxDecoration(
                  //     borderRadius: const BorderRadius.all(Radius.circular(8)),
                  //     border: Border.all(
                  //       color: AppColors.white,
                  //     ),
                  //   ),
                  //   child: Padding(
                  //     padding: const EdgeInsets.symmetric(
                  //         horizontal: 24, vertical: 8.0),
                  //     child: Text(
                  //       'abc',
                  //       style: appCubit.styles.defaultTextStyle(),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Transform.scale(
                    scale: 1.5,
                    child: Checkbox(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5.r))),
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value!;
                        });
                      },
                      value: isChecked,
                      side: MaterialStateBorderSide.resolveWith(
                        (states) => const BorderSide(
                            width: 1.0, color: AppColors.white),
                      ),
                      activeColor: Colors.transparent,
                      //activeColor: AppColors.white,
                    ),
                  ),
                  Text(
                    'Rare',
                    style: appCubit.styles.defaultPurpleTextStyle(),
                  ),
                  // Container(
                  //   decoration: BoxDecoration(
                  //     borderRadius: const BorderRadius.all(Radius.circular(8)),
                  //     border: Border.all(
                  //       color: AppColors.white,
                  //     ),
                  //   ),
                  //   child: Padding(
                  //     padding: const EdgeInsets.symmetric(
                  //         horizontal: 24, vertical: 8.0),
                  //     child: Text(
                  //       'abc',
                  //       style: appCubit.styles.defaultTextStyle(),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Transform.scale(
                    scale: 1.5,
                    child: Checkbox(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5.r))),
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value!;
                        });
                      },
                      value: isChecked,
                      side: MaterialStateBorderSide.resolveWith(
                        (states) => const BorderSide(
                            width: 1.0, color: AppColors.white),
                      ),
                      activeColor: Colors.transparent,
                      //activeColor: AppColors.white,
                    ),
                  ),
                  Text(
                    'Epic',
                    style: appCubit.styles.defaultOrangeTextStyle(),
                  ),
                  // Container(
                  //   decoration: BoxDecoration(
                  //     borderRadius: const BorderRadius.all(Radius.circular(8)),
                  //     border: Border.all(
                  //       color: AppColors.white,
                  //     ),
                  //   ),
                  //   child: Padding(
                  //     padding: const EdgeInsets.symmetric(
                  //         horizontal: 24, vertical: 8.0),
                  //     child: Text(
                  //       'abc',
                  //       style: appCubit.styles.defaultTextStyle(),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Transform.scale(
                    scale: 1.5,
                    child: Checkbox(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5.0))),
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value!;
                        });
                      },
                      value: isChecked,
                      side: MaterialStateBorderSide.resolveWith(
                        (states) => const BorderSide(
                            width: 1.0, color: AppColors.white),
                      ),
                      activeColor: Colors.transparent,
                      //activeColor: AppColors.white,
                    ),
                  ),
                  Text(
                    'Legendary',
                    style: appCubit.styles.defaultGradientTextStyle(),
                  ),
                  // Container(
                  //   decoration: BoxDecoration(
                  //     borderRadius: const BorderRadius.all(Radius.circular(8)),
                  //     border: Border.all(
                  //       color: AppColors.white,
                  //     ),
                  //   ),
                  //   child: Padding(
                  //     padding: const EdgeInsets.symmetric(
                  //         horizontal: 24, vertical: 8.0),
                  //     child: Text(
                  //       'abc',
                  //       style: appCubit.styles.defaultTextStyle(),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Filter extends StatefulWidget {
  final String title;

  const Filter({Key? key, required this.title}) : super(key: key);

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  SfRangeValues value = const SfRangeValues(0, 100);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppCubit appCubit = context.read<AppCubit>();
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(8.w),
            child: Text(
              widget.title,
              style: appCubit.styles.defaultTextStyle(),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(16.r)),
                  border: Border.all(
                    color: AppColors.white,
                  ),
                ),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.0.h),
                  child: Text(
                    value.start.toInt().toString(),
                    style: appCubit.styles.defaultTextStyle(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '-',
                  style: appCubit.styles.defaultTextStyle(),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(16.r)),
                  border: Border.all(
                    color: AppColors.white,
                  ),
                ),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
                  child: Text(
                    value.end.toInt().toString(),
                    style: appCubit.styles.defaultTextStyle(),
                  ),
                ),
              ),
            ],
          ),
          SfRangeSlider(
            min: 0.0,
            max: 100.0,
            values: value,
            interval: 1,
            activeColor: AppColors.artyClickOceanGreen,
            inactiveColor: AppColors.white,
            stepSize: 1,
            enableTooltip: true,
            minorTicksPerInterval: 1,
            onChanged: (SfRangeValues values) {
              setState(() {
                value = values;
              });
            },
          ),
        ],
      ),
    );
  }
}
