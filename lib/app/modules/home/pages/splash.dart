import "package:animated_splash_screen/animated_splash_screen.dart";
import "package:flutter/material.dart";
import "package:page_transition/page_transition.dart";

import "../../../config/app_constant.dart";
import "../../../config/app_message.dart";
import "../../../config/app_theme.dart";
import "../views/home_view.dart";
import "../widgets/bounce_point.dart";

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        children: <Widget>[
          Expanded(flex: 3, child: Image.asset(AppMessage.appLogo, width: 200, height: 200)),
          const Expanded(child: BouncePoint(size: 60)),
        ],
      ),
      nextScreen: const HomeView(),
      curve: AppConstant.curve,
      backgroundColor: AppTheme.primaryBackColor,
      splashTransition: SplashTransition.slideTransition,
      pageTransitionType: PageTransitionType.rightToLeftWithFade,
      animationDuration: AppConstant.durationSplash,
      splashIconSize: double.infinity,
    );
  }
}
