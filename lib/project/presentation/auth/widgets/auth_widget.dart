import 'package:bonfire_adventures/project/application/auth/auth_cubit.dart';
import 'package:bonfire_adventures/project/presentation/auth/pages/login_page.dart';
import 'package:bonfire_adventures/project/presentation/auth/pages/onboarding_page.dart';
import 'package:bonfire_adventures/project/presentation/auth/pages/splash_page.dart';
import 'package:bonfire_adventures/project/presentation/auth/widgets/home_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/services.dart';

class AuthWidget extends StatelessWidget {
  const AuthWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 480, height: 854, allowFontScaling: true);

    return BlocBuilder<AuthCubit, AuthState>(
        builder: (BuildContext context, AuthState state) {
      return state.map(uninitialized: (_) {
        return SplashPage();
      }, authenticated: (_) {
        showStatusBar();
        return HomeWidget();
      }, unauthenticated: (_) {
        return LoginPage();
      }, onboarding: (_) {
        return GooeyEdgeOnboardingPage();
      });
    });
  }
}

showStatusBar() async {
  await SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
}
