import 'package:animations/animations.dart';
import 'package:bonfire_adventures/project/presentation/auth/pages/onboarding_page.dart';
import 'package:bonfire_adventures/project/presentation/auth/pages/login_page.dart';
import 'package:bonfire_adventures/project/presentation/auth/widgets/auth_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Routes {
  static final routes = [
    GetPage(
      name: '/',
      page: () => AuthWidget(),
    ),
    GetPage(
      name: '/gooeyedgeonboardingpage',
      page: () => GooeyEdgeOnboardingPage(),
      customTransition: FadeThroughTransitions(),
    ),
    GetPage(
      name: '/loginpage',
      page: () => LoginPage(),
      customTransition: FadeThroughTransitions(),
    ),
  ];
}

class FadeThroughTransitions extends CustomTransition {
  @override
  Widget buildTransition(
      BuildContext context,
      Curve curve,
      Alignment alignment,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    return FadeThroughTransition(
      animation: animation,
      secondaryAnimation: secondaryAnimation,
      child: child,
    );
  }
}

class FadeScaleTransitions extends CustomTransition {
  @override
  Widget buildTransition(
      BuildContext context,
      Curve curve,
      Alignment alignment,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    return FadeScaleTransition(
      animation: animation,
      child: child,
    );
  }
}

class SharedAxisTransitions extends CustomTransition {
  @override
  Widget buildTransition(
      BuildContext context,
      Curve curve,
      Alignment alignment,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    return SharedAxisTransition(
      animation: animation,
      secondaryAnimation: secondaryAnimation,
      transitionType: SharedAxisTransitionType.scaled,
      child: child,
    );
  }
}
