import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mubaha/ui/router/app_router.dart';
import 'package:mubaha/ui/screen/calculator/calculator_screen.dart';

import 'package:mubaha/ui/screen/main/main_screen.dart';

import 'package:mubaha/ui/screen/sign_up/sign_up_screen.dart';
import 'package:mubaha/ui/screen/splash/splash_screen.dart';
import 'package:auto_route/annotations.dart';

import '../screen/choose_theme/choose_theme_screen.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
        page: SplashScreen,
        name: "SplashPage",
        path: AppRoutes.splashScreen,
        initial: true),
    AutoRoute(page: MainScreen, name: "MainPage", path: AppRoutes.main),
    AutoRoute(page: SignUpScreen, name: "SignUp", path: AppRoutes.signup),
    AutoRoute(page: CalculatorScreen, name: "Calculator", path: AppRoutes.calculator),
    AutoRoute(page: ChooseThemeScreen, name: "ChooseTheme", path: AppRoutes.chooseTheme),
  ],
)
class $AppRouter {}

Widget slideBottomToTop(context, animation, secondaryAnimation, child) {
  const begin = Offset(0.0, 1.0);
  const end = Offset.zero;
  const curve = Curves.fastLinearToSlowEaseIn;

  var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

  return SlideTransition(
    position: animation.drive(tween),
    child: child,
  );
}
