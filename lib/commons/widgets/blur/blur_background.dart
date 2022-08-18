

import 'dart:ui';

import 'package:flutter/material.dart';

import '../border/border_content.dart';

class BlurBackground extends StatelessWidget {
  final BorderContent child;
  final double sigmaX;
  final double sigmaY;
  const BlurBackground({Key? key, required this.child
    , required this.sigmaX, required this.sigmaY}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(child.radius)),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: sigmaX, sigmaY: sigmaY),
        child: child,
      ),
    );
  }
}
