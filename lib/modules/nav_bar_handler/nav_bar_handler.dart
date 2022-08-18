import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobile_guys_run/commons/utils/app_colors.dart';
import 'package:mobile_guys_run/commons/utils/app_images.dart';
import 'package:mobile_guys_run/commons/utils/app_tab_bar.dart';
import 'package:mobile_guys_run/modules/challenge/challenge_routes.dart';
import 'package:mobile_guys_run/modules/marketplace/market_place_routes.dart';
import 'package:mobile_guys_run/modules/my_NFTs/my_NFTs_routes.dart';
import 'package:mobile_guys_run/modules/profile/profile_routes.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key}) : super(key: key);
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   late AppCubit appCubit;
//   int _selectedIndex = 0;
//   List<Widget> listScreen = [
//     const ChallengeScreen(),
//     const MyNFTs(),
//     const MarketPlace(),
//     const ProfileScreen()
//   ];
//
//   @override
//   void initState() {
//     super.initState();
//     appCubit = context.read<AppCubit>();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: IndexedStack(
//         index: _selectedIndex,
//         children: listScreen,
//       ),
//       backgroundColor: appCubit.styles.themeData!.backgroundColor,
//       bottomNavigationBar: _getBottomNavigationBar(context),
//     );
//   }
//
//   ClipRRect _getBottomNavigationBar(BuildContext context) {
//     return ClipRRect(
//       borderRadius: const BorderRadius.only(
//         topRight: Radius.circular(20),
//         topLeft: Radius.circular(20),
//       ),
//       child: Theme(
//         data: Theme.of(context).copyWith(
//           canvasColor: AppColors.blackOut,
//         ),
//         child: BottomNavigationBar(
//           type: BottomNavigationBarType.fixed,
//           items: <BottomNavigationBarItem>[
//             buildBottomNavigationBarItem(
//                 AppAssets.challenges, AppTabBar.challenges,
//                 notification: true),
//             buildBottomNavigationBarItem(AppAssets.myNFTs, AppTabBar.myNFTs),
//             buildBottomNavigationBarItem(AppAssets.market, AppTabBar.market),
//             buildBottomNavigationBarItem(AppAssets.profile, AppTabBar.profile),
//           ],
//           showSelectedLabels: false,
//           showUnselectedLabels: false,
//           // selectedIconTheme: const IconThemeData(color: AppColors.white),
//           // unselectedIconTheme: const IconThemeData(color: AppColors.tin),
//           currentIndex: _selectedIndex,
//           onTap: _onItemTapped,
//         ),
//       ),
//     );
//   }
//
//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }
//
//   // AppBarDetail _buildAppBar(int index) {
//   //   switch (index) {
//   //     case 0:
//   //       {
//   //         return AppBarDetail(title: AppTabBar.challenges, isBack: false);
//   //       }
//   //     case 1:
//   //       {
//   //         return AppBarDetail(title: AppTabBar.myNFTs, isBack: false);
//   //       }
//   //     case 2:
//   //       {
//   //         return AppBarDetail(title: AppTabBar.market, isBack: false);
//   //       }
//   //     case 3:
//   //       {
//   //         return AppBarDetail(title: AppTabBar.profile, isBack: false);
//   //       }
//   //     default:
//   //       return AppBarDetail(title: AppTabBar.challenges, isBack: false);
//   //   }
//   // }
//
//   //buildBottomNavigationBarItem
//   BottomNavigationBarItem buildBottomNavigationBarItem(
//       String appAssets, String label,
//       {bool notification = false}) {
//     return BottomNavigationBarItem(
//       icon: notification
//           ? Stack(
//               children: [
//                 AppImage.asset(assetPath: appAssets, iconColor: AppColors.tin),
//                 Positioned(
//                   right: 0,
//                   child: AppImage.asset(
//                       assetPath: AppAssets.dot,
//                       iconColor: AppColors.artyClickOceanGreen),
//                 ),
//               ],
//             )
//           : AppImage.asset(assetPath: appAssets, iconColor: AppColors.tin),
//       label: label,
//       activeIcon:
//           AppImage.asset(assetPath: appAssets, iconColor: AppColors.white),
//     );
//   }
// }

final challengeKey = GlobalKey<NavigatorState>();
final myNFTsKey = GlobalKey<NavigatorState>();
final marketKey = GlobalKey<NavigatorState>();
final profileKey = GlobalKey<NavigatorState>();
final NavbarNotifier _navbarNotifier = NavbarNotifier();

class NavbarNotifier extends ChangeNotifier {
  int _index = 0;

  int get index => _index;
  bool _hideBottomNavBar = false;

  set index(int x) {
    _index = x;
    notifyListeners();
  }

  bool get hideBottomNavBar => _hideBottomNavBar;

  set hideBottomNavBar(bool x) {
    _hideBottomNavBar = x;
    notifyListeners();
  }

  // pop routes from the nested navigator stack and not the main stack
  // this is done based on the currentIndex of the bottom navbar
  // if the backButton is pressed on the initial route the app will be terminated
  FutureOr<bool> onBackButtonPressed() async {
    bool exitingApp = true;
    switch (_navbarNotifier.index) {
      case 0:
        if (challengeKey.currentState != null &&
            challengeKey.currentState!.canPop()) {
          challengeKey.currentState!.pop();
          exitingApp = false;
        }
        break;
      case 1:
        if (myNFTsKey.currentState != null &&
            myNFTsKey.currentState!.canPop()) {
          myNFTsKey.currentState!.pop();
          exitingApp = false;
        }
        break;
      case 2:
        if (marketKey.currentState != null &&
            marketKey.currentState!.canPop()) {
          marketKey.currentState!.pop();
          exitingApp = false;
        }
        break;
      case 3:
        if (profileKey.currentState != null &&
            profileKey.currentState!.canPop()) {
          profileKey.currentState!.pop();
          exitingApp = false;
        }
        break;
      default:
        return false;
    }
    if (exitingApp) {
      return true;
    } else {
      return false;
    }
  }

  // pops all routes except first, if there are more than 1 route in each navigator stack
  void popAllRoutes(int index) {
    switch (index) {
      case 0:
        if (challengeKey.currentState!.canPop()) {
          challengeKey.currentState!.popUntil((route) => route.isFirst);
        }
        return;
      case 1:
        if (myNFTsKey.currentState!.canPop()) {
          myNFTsKey.currentState!.popUntil((route) => route.isFirst);
        }
        return;
      case 2:
        if (marketKey.currentState!.canPop()) {
          marketKey.currentState!.popUntil((route) => route.isFirst);
        }
        return;
      case 3:
        if (profileKey.currentState!.canPop()) {
          profileKey.currentState!.popUntil((route) => route.isFirst);
        }
        return;
      default:
        break;
    }
  }
}

Future<void> navigate(BuildContext context, String route,
        {bool isDialog = false,
        bool isRootNavigator = true,
        Map<String, dynamic>? arguments}) =>
    Navigator.of(context, rootNavigator: isRootNavigator)
        .pushNamed(route, arguments: arguments);

class AnimatedNavBar extends StatefulWidget {
  const AnimatedNavBar(
      {Key? key,
      required this.model,
      // required this.menuItems,
      required this.onItemTapped})
      : super(key: key);

  //final List<MenuItem> menuItems;
  final NavbarNotifier model;
  final Function(int) onItemTapped;

  @override

  State<AnimatedNavBar> createState() => _AnimatedNavBarState();
}

class _AnimatedNavBarState extends State<AnimatedNavBar>
    with SingleTickerProviderStateMixin {
  @override
  void didUpdateWidget(covariant AnimatedNavBar oldWidget) {
    if (widget.model.hideBottomNavBar != isHidden) {
      if (!isHidden) {
        _showBottomNavBar();
      } else {
        _hideBottomNavBar();
      }
      isHidden = !isHidden;
    }
    super.didUpdateWidget(oldWidget);
  }

  void _hideBottomNavBar() {
    _controller.reverse();
    return;
  }

  void _showBottomNavBar() {
    _controller.forward();
    return;
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 2), vsync: this)
      ..addListener(() => setState(() {}));
    animation = Tween(begin: 0.0, end: 100.0).animate(_controller);
  }

  late AnimationController _controller;
  late Animation<double> animation;
  bool isHidden = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animation,
        builder: (BuildContext context, Widget? child) {
          return ClipRRect(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20),
            ),
            child: Theme(
              data: Theme.of(context).copyWith(
                canvasColor: AppColors.blackOut,
              ),
              child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                items: <BottomNavigationBarItem>[
                  buildBottomNavigationBarItem(
                      AppAssets.challenges, AppTabBar.challenges,
                      notification: true),
                  buildBottomNavigationBarItem(
                      AppAssets.myNFTs, AppTabBar.myNFTs),
                  buildBottomNavigationBarItem(
                      AppAssets.market, AppTabBar.market),
                  buildBottomNavigationBarItem(
                      AppAssets.profile, AppTabBar.profile),
                ],
                showSelectedLabels: false,
                showUnselectedLabels: false,
                // selectedIconTheme: const IconThemeData(color: AppColors.white),
                // unselectedIconTheme: const IconThemeData(color: AppColors.tin),
                currentIndex: widget.model.index,
                onTap: (x) {
                  widget.onItemTapped(x);
                },
              ),
            ),
          );
        });
  }

  BottomNavigationBarItem buildBottomNavigationBarItem(
      String appAssets, String label,
      {bool notification = false}) {
    return BottomNavigationBarItem(
      icon: notification
          ? Stack(
              children: [
                AppImage.asset(assetPath: appAssets, iconColor: AppColors.tin),
                Positioned(
                  right: 0,
                  child: AppImage.asset(
                      assetPath: AppAssets.dot,
                      iconColor: AppColors.artyClickOceanGreen),
                ),
              ],
            )
          : AppImage.asset(assetPath: appAssets, iconColor: AppColors.tin),
      label: label,
      activeIcon:
          AppImage.asset(assetPath: appAssets, iconColor: AppColors.white),
    );
  }
}

class NavBarHandler extends StatefulWidget {
  const NavBarHandler({Key? key}) : super(key: key);
  static const String route = '/';

  @override
  State<NavBarHandler> createState() => _NavBarHandlerState();
}

class _NavBarHandlerState extends State<NavBarHandler>
    with SingleTickerProviderStateMixin {
  final _buildBody = const <Widget>[
    ChallengeRoutes(),
    MyNFTsRoutes(),
    MarketPlaceRoutes(),
    ProfileRoutes()
  ];


  late Animation<double> fadeAnimation;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
    fadeAnimation = Tween<double>(begin: 0.4, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn),
    );
  }

  void showSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        behavior: SnackBarBehavior.floating,
        duration: Duration(milliseconds: 600),
        margin: EdgeInsets.only(
            bottom: kBottomNavigationBarHeight, right: 2, left: 2),
        content: Text('Tap back button again to exit'),
      ),
    );
  }

  void hideSnackBar() {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  DateTime oldTime = DateTime.now();
  DateTime newTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final bool isExitingApp = await _navbarNotifier.onBackButtonPressed();
        if (isExitingApp) {
          newTime = DateTime.now();
          int difference = newTime.difference(oldTime).inMilliseconds;
          oldTime = newTime;
          if (difference < 1000) {
            hideSnackBar();
            return isExitingApp;
          } else {
            showSnackBar();
            return false;
          }
        } else {
          return isExitingApp;
        }
      },
      child: Material(
        child: AnimatedBuilder(
            animation: _navbarNotifier,
            builder: (context, snapshot) {
              return Stack(
                children: [
                  IndexedStack(
                    index: _navbarNotifier.index,
                    children: [
                      for (int i = 0; i < _buildBody.length; i++)
                        _buildBody[i]
                        // FadeTransition(
                        //     opacity: fadeAnimation,
                        //     child: _buildBody[i])
                    ],
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: AnimatedNavBar(
                      model: _navbarNotifier,
                      onItemTapped: (x) {
                        // User pressed  on the same tab twice
                        if (_navbarNotifier.index == x) {
                          _navbarNotifier.popAllRoutes(x);
                        } else {
                          _navbarNotifier.index = x;
                          _controller.reset();
                          _controller.forward();
                        }
                      },
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
