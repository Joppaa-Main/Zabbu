import 'package:flutter/material.dart';
import 'package:zabbu/core/layout/adaptive.dart';
import 'package:zabbu/values/values.dart';

class ContentWrapper extends StatelessWidget {
  ContentWrapper({
    this.width,
    this.height,
    this.color = AppColors.white,
    this.gradient,
    this.child,
  });

  final double? width;
  final double? height;
  final Color color;
  final Gradient? gradient;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? widthOfScreen(context),
      height: height ?? heightOfScreen(context),
      decoration: BoxDecoration(color: color, gradient: gradient),
      child: child,
    );
  }
}
