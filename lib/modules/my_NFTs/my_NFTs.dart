import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_guys_run/app/cubit/app_cubit.dart';
import 'package:mobile_guys_run/commons/widgets/app_bar/app_bar.dart';
import 'package:mobile_guys_run/commons/widgets/dropdown/dropdown.dart';
import 'package:mobile_guys_run/commons/widgets/items/sneaker_item.dart';
import 'package:mobile_guys_run/modules/nav_bar_handler/models/sneaker.dart';

class MyNFTs extends StatefulWidget {
  const MyNFTs({Key? key}) : super(key: key);
  static const String route = '/';

  @override
  State<MyNFTs> createState() => _MyNFTsState();
}

class _MyNFTsState extends State<MyNFTs> {
  late AppCubit appCubit;
  late List<Sneaker> sneakers = [
    Sneaker(),
    Sneaker(),
    Sneaker(),
    Sneaker(),
  ];
  final List<String> items = [
    'Rarity',
    'Lowest price',
    'Highest price',
  ];
  late String selectedValue;

  @override
  void initState() {
    super.initState();
    appCubit = context.read<AppCubit>();
    selectedValue = items[0];
  }

  @override
  Widget build(BuildContext context) {
    //var size = MediaQuery.of(context).size;
    /*24 is for notification bar on Android*/
    // final double itemHeight = (size.height.h - kToolbarHeight.h - 24.h) / 2;
    // final double itemWidth = size.width.w / 2;

    return Scaffold(
      backgroundColor: appCubit.styles.themeData!.backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.fromLTRB(32.w, 0, 32.h, 90.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const AppBarDetail(title: "MY NFTS", isBack: false),

              Padding(
                padding:  EdgeInsets.only(bottom: 34.0.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${sneakers.length} Characters",
                      style: appCubit.styles.defaultSubTitleStyle(),
                    ),
                    Dropdown(
                      items: items,
                      onChanged: (value) {
                        setState(() {
                          selectedValue = value as String;
                        });
                      },
                      selectedValue: selectedValue,
                    )
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

  _renderListItem(List<Sneaker> sneakers) {
    return List.generate(
        sneakers.length, (index) => SneakerItem(sneaker: sneakers[index]));
  }
}
