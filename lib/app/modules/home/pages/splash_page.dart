import "package:animated_splash_screen/animated_splash_screen.dart";
import "package:flutter/material.dart";
import "package:page_transition/page_transition.dart";

import "../../../config/app_constant.dart";
import "../../../config/app_message.dart";
import "../../../config/app_theme.dart";
import "../views/home_view.dart";
import "../widgets/bounce_point.dart";

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        children: <Widget>[
          Expanded(flex: 2, child: Center(child: Image.asset(AppMessage.appIcon, width: 200, height: 200))),
          const Expanded(child: BouncePoint(size: 64, color: AppTheme.main_color_1)),
        ],
      ),
      nextScreen: const HomeView(),
      curve: AppConstant.curve,
      backgroundColor: AppTheme.back_color_2,
      splashTransition: SplashTransition.slideTransition,
      pageTransitionType: PageTransitionType.rightToLeftWithFade,
      animationDuration: AppConstant.durationSplash,
      splashIconSize: double.infinity,
    );
  }
}
