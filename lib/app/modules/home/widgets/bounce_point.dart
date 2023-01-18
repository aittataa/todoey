import "package:flutter/material.dart";
import "package:flutter_spinkit/flutter_spinkit.dart";

import "../../../config/app_constant.dart";
import "../../../config/app_theme.dart";

class BouncePoint extends StatelessWidget {
  final bool? state;
  final double size;
  final Color color;

  const BouncePoint({
    super.key,
    this.state, // = true,
    this.size = 30,
    this.color = AppTheme.mainColor,
  });

  @override
  Widget build(BuildContext context) {
    switch (state) {
      case true:
        return SpinKitThreeBounce(
          size: size,
          color: color,
          duration: AppConstant.durationSplash,
        );
      case false:
        return SpinKitSquareCircle(
          size: size,
          color: color,
          duration: AppConstant.durationSplash,
        );
      default:
        // return SpinKitCircle(
        // return SpinKitDualRing(
        return SpinKitRipple(
          size: size,
          color: color,
          duration: AppConstant.durationSplash,
        );
    }
  }
}
