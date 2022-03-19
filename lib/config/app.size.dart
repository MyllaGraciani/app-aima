import 'package:flutter/material.dart';

class SizeConfig {
  final MediaQueryData mediaQueryData;

  SizeConfig({required this.mediaQueryData});

  static SizeConfig of(BuildContext context) =>
      SizeConfig(mediaQueryData: MediaQuery.of(context));

  double dynamicScaleSize(
      {required double size,
      double? scaleFactorTablet,
      double? scaleFactorMini}) {
    if (isMini()) {
      final scaleFactor = scaleFactorMini ?? 0.5; //era 8
      return size * scaleFactor;
    }

    return size;
  }

  dynamicScalePadding({required value}) {
    var mWidth = mediaQueryData.size.width;
    return mWidth * value;
  }

  bool isMini() {
    final shortestSide = mediaQueryData.size.shortestSide;
    return shortestSide <= 360;
  }
}
