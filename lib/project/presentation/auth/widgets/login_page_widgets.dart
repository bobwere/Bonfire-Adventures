import 'package:animation_director/animation_director.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bonfire_adventures/common/constants/bezier_clippers.dart';
import 'package:bonfire_adventures/common/constants/styles.dart';
import 'package:bonfire_adventures/common/utils/clip_shadow_path.dart';
import 'package:bonfire_adventures/project/application/login/login_cubit.dart';
import 'package:division/division.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final boxShadow = BoxShadow(
  color: Colors.black54,
  offset: Offset(5.h, 5.h),
  blurRadius: 5.h,
  spreadRadius: 10.h,
);

final bottomBoxShadow = BoxShadow(
  color: Colors.black54,
  offset: Offset(-3.h, -5.h),
  blurRadius: 5.h,
  spreadRadius: 10.h,
);

final container = Container(
  height: Get.height,
  width: Get.width,
  color: Color(0xFF224C36),
);

ActorWidget backGround({BuildContext context, int startInMilliseconds}) {
  return ActorWidget(name: 'Background', actions: [
    ActorAction(
        character: ActorCharacter(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(color: Colors.white),
    ))
  ]);
}

ActorWidget bottomCurve(
    {BuildContext context, int startInMilliseconds, int duration}) {
  return ActorWidget(name: 'BottomCurve', actions: [
    ActorAction(
        position: ActorPosition(
            top: 680.h, bottom: -680.h, right: -180.h, left: 180.h)),
    ActorAction(
      waitBeforeStart: Duration(milliseconds: startInMilliseconds),
      position: ActorPosition(
        top: 615.h,
        bottom: -615.h,
        right: -130.h,
        left: 130.h,
        curve: Curves.elasticOut,
        duration: Duration(milliseconds: duration),
      ),
      character: ActorCharacter(
        child: ClipShadowPath(
            shadow: bottomBoxShadow,
            clipper: BottomBezierClipper(),
            child: container),
      ),
    )
  ]);
}

ActorWidget greetingText(
    {BuildContext context,
    int startInMilliseconds,
    int duration,
    String greeting}) {
  return ActorWidget(name: 'Greeting', actions: [
    ActorAction(
        opacity: ActorOpacity(opacity: 0),
        position:
            ActorPosition(top: -0.h, bottom: 00.h, right: -20.h, left: 20.h)),
    ActorAction(
      waitBeforeStart: Duration(milliseconds: 50),
      opacity: ActorOpacity(opacity: 1),
      position: ActorPosition(
          top: 180.h,
          bottom: -180.h,
          right: -20.h,
          left: 20.h,
          curve: Curves.elasticOut,
          duration: Duration(milliseconds: 1500)),
      character: ActorCharacter(
        child: Txt(
          greeting,
          style: kLoginGreetingTextStyle,
        ),
      ),
    )
  ]);
}

ActorWidget topCurve(
    {BuildContext context, int startInMilliseconds, int duration}) {
  return ActorWidget(name: 'TopCurve', actions: [
    ActorAction(
        position: ActorPosition(
            top: -100.h, bottom: 100.h, right: 100.h, left: -100.h)),
    ActorAction(
      waitBeforeStart: Duration(milliseconds: startInMilliseconds),
      position: ActorPosition(
          top: -50.h,
          bottom: 50.h,
          right: 60.h,
          left: -60.h,
          curve: Curves.elasticOut,
          duration: Duration(milliseconds: duration)),
      character: ActorCharacter(
        child: ClipShadowPath(
            shadow: boxShadow, clipper: TopBezierClipper(), child: container),
      ),
    )
  ]);
}

ActorWidget loginWithGoogle(
    {BuildContext context, int startInMilliseconds, int duration}) {
  return ActorWidget(name: 'Login with Google', actions: [
    ActorAction(
        waitBeforeStart: Duration(milliseconds: startInMilliseconds),
        position: ActorPosition(
          top: Get.height / 2 + 60.h,
          left: 0.h,
          right: 0.h,
        ),
        character: ActorCharacter(
          child: Parent(
            gesture: Gestures()
              ..onTap(() {
                context.bloc<LoginCubit>().loginWithGooglePressed();
              }),
            style: kLoginButtonStyle,
            child: Txt(
              'Login With Google',
              style: kLoginButtonTextStyle,
            ),
          ),
        ),
        scale: ActorScale(startScale: 0, finishScale: 0)),
    ActorAction(
      scale: ActorScale(
          alignment: Alignment.center,
          startScale: 0,
          finishScale: 1,
          curve: Curves.elasticOut,
          duration: Duration(milliseconds: duration)),
    ),
  ]);
}

ActorWidget orText(
    {BuildContext context, int startInMilliseconds, int duration}) {
  return ActorWidget(name: '-Or-', actions: [
    ActorAction(
      waitBeforeStart: Duration(milliseconds: startInMilliseconds),
      position: ActorPosition(
        top: Get.height / 2,
        left: 0.h,
        right: 0.h,
      ),
      opacity: ActorOpacity(opacity: 0),
      character: ActorCharacter(
        child: Txt(
          '-Or-',
          style: kLoginButtonTextStyle.clone()..textColor(Colors.black),
        ),
      ),
    ),
    ActorAction(
      opacity:
          ActorOpacity(opacity: 1, duration: Duration(milliseconds: duration)),
    ),
  ]);
}

ActorWidget loginWithFacebook(
    {BuildContext context, int startInMilliseconds, int duration}) {
  return ActorWidget(name: 'Login with Facebook', actions: [
    ActorAction(
        waitBeforeStart: Duration(milliseconds: startInMilliseconds),
        position: ActorPosition(
          top: Get.height / 2 - 100.h,
          left: 0.h,
          right: 0.h,
        ),
        character: ActorCharacter(
          child: Parent(
            gesture: Gestures()
              ..onTap(() {
                context.bloc<LoginCubit>().loginWithFacebookPressed();
              }),
            style: kLoginButtonStyle,
            child: Txt(
              'Login With Facebook',
              style: kLoginButtonTextStyle,
            ),
          ),
        ),
        scale: ActorScale(startScale: 0, finishScale: 0)),
    ActorAction(
      scale: ActorScale(
          alignment: Alignment.center,
          startScale: 0,
          finishScale: 1,
          curve: Curves.elasticOut,
          duration: Duration(milliseconds: duration)),
    ),
  ]);
}
