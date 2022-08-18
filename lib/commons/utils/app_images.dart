import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppAssets {
  static const String url = 'assets/images';
  static const String icLogo = '$url/logo.svg';
  static const String challenges = '$url/challenges.svg';
  static const String market = '$url/market.svg';
  static const String myNFTs = '$url/my_NFTs.svg';
  static const String profile = '$url/profile.svg';
  static const String dot = '$url/dot.svg';
  static const String icArrow = '$url/arrow.svg';
  static const String purpleCircle = '$url/purple_circle.svg';
  static const String greenCircle = '$url/green_circle.svg';
  static const String logoPlus = '$url/logo_plus.png';
  static const String shoe = '$url/shoe.png';
  static const String avatar = '$url/avatar.png';
  static const String pause = '$url/pause.svg';
  static const String play = '$url/play.svg';
  static const String legendary = '$url/legendary.png';
  static const String setting = '$url/setting.svg';
  static const String backdrop = '$url/backdrop.png';
  static const String pen = '$url/pen.svg';
  static const String delete = '$url/delete.svg';
  static const String blueShoe = '$url/blue_shoe.png';
  static const String orangeShoe = '$url/orange_shoe.png';
  static const String add = '$url/add.svg';
  static const String logoBackground = '$url/logoBackground.png';
}

class AppImage {
  static Widget network(
      {required String url,
      BoxFit fit = BoxFit.fill,
      double? width,
      double? height,
      Color color = Colors.transparent}) {
    return Container(
      color: color,
      width: width,
      height: height,
      child: (url != '')
          ? Image.network(
              url,
              fit: fit,
            )
          : const SizedBox(),
    );
  }

  static Widget asset(
      {@required String? assetPath,
      Color color = Colors.transparent,
      Color? iconColor,
      BoxFit fit = BoxFit.fill,
      double? width,
      double? height}) {
    final imagePath = assetPath ?? '';
    final isSVG = imagePath.endsWith('.svg');
    if (assetPath == null) return Container();
    return Container(
      color: color,
      child: isSVG
          ? SvgPicture.asset(
              assetPath,
              fit: fit,
              width: width,
              height: height,
              color: iconColor,
            )
          : Image.asset(
              assetPath,
              width: width,
              height: height,
              fit: fit,
            ),
    );
  }
}
