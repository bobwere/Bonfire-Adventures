import 'package:animation_director/animation_director.dart';
import 'package:bonfire_adventures/common/constants/bezier_clippers.dart';
import 'package:bonfire_adventures/common/constants/styles.dart';
import 'package:bonfire_adventures/common/utils/clip_shadow_path.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animations/loading_animations.dart';

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

ActorWidget backGround({BuildContext context}) {
  return ActorWidget(name: 'Background', actions: [
    ActorAction(
        character: ActorCharacter(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(color: kBackgroundColor)))
  ]);
}

ActorWidget bottomCurve(
    {BuildContext context, int startInMilliseconds, int duration}) {
  return ActorWidget(name: 'BottomCurve', actions: [
    ActorAction(
        position: ActorPosition(
            top: 650.h, bottom: -650.h, right: -100.h, left: 100.h)),
    ActorAction(
      waitBeforeStart: Duration(milliseconds: startInMilliseconds),
      position: ActorPosition(
        top: 600.h,
        bottom: -600.h,
        right: -50.h,
        left: 50.h,
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

ActorWidget topOvalShape(
    {BuildContext context, int startInMilliseconds, int duration}) {
  return ActorWidget(name: 'TopOvalShape', actions: [
    ActorAction(
        position:
            ActorPosition(top: 50.h, bottom: -50.h, right: -10.h, left: 10.h)),
    ActorAction(
      waitBeforeStart: Duration(milliseconds: duration),
      position: ActorPosition(
          top: 110.h,
          bottom: -110.h,
          left: 150.h,
          right: -150.h,
          curve: Curves.elasticOut,
          duration: Duration(milliseconds: startInMilliseconds)),
      character: ActorCharacter(
        child: ClipShadowPath(
            shadow: boxShadow, clipper: OvalBezierClipper(), child: container),
      ),
    )
  ]);
}

ActorWidget logo(
    {BuildContext context, int startInMilliseconds, int duration}) {
  return ActorWidget(name: 'Logo', actions: [
    ActorAction(
        waitBeforeStart: Duration(milliseconds: startInMilliseconds),
        character: ActorCharacter(
          child: Center(
            child: Image.asset('assets/images/logo.png',
                fit: BoxFit.cover, scale: 1.5, color: Colors.white),
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

ActorWidget loadingAnimation(
    {BuildContext context,
    int startInMilliseconds,
    int opacityStartInMilliseconds,
    int duration}) {
  return ActorWidget(name: 'loadinganimation', actions: [
    ActorAction(
      waitBeforeStart: Duration(milliseconds: startInMilliseconds),
      position: ActorPosition(
          top: MediaQuery.of(context).size.height / 2 + 80.h,
          left: MediaQuery.of(context).size.width / 2 - 30.h),
      opacity: ActorOpacity(opacity: 0),
      character: ActorCharacter(
        child: LoadingBouncingGrid.circle(
          size: 55.h,
          backgroundColor: Colors.white,
          inverted: true,
        ),
      ),
    ),
    ActorAction(
      waitBeforeStart: Duration(milliseconds: opacityStartInMilliseconds),
      opacity: ActorOpacity(
        opacity: 1,
        duration: Duration(milliseconds: duration),
      ),
    )
  ]);
}

ActorWidget topCurve(
    {BuildContext context, int startInMilliseconds, int duration}) {
  return ActorWidget(name: 'TopCurve', actions: [
    ActorAction(
        position:
            ActorPosition(top: -52.h, bottom: 52.h, right: 51.h, left: -51.h)),
    ActorAction(
      waitBeforeStart: Duration(milliseconds: startInMilliseconds),
      position: ActorPosition(
          top: -2.h,
          bottom: 2.h,
          right: 1.h,
          left: -1.h,
          curve: Curves.elasticOut,
          duration: Duration(milliseconds: duration)),
      character: ActorCharacter(
        child: ClipShadowPath(
            shadow: boxShadow, clipper: TopBezierClipper(), child: container),
      ),
    )
  ]);
}

ActorWidget bottomLeftCurve(
    {BuildContext context, int startInMilliseconds, int duration}) {
  return ActorWidget(name: 'BottomLeftCurve', actions: [
    ActorAction(
        position: ActorPosition(
            top: 600.h, bottom: -600.h, right: 51.h, left: -51.h)),
    ActorAction(
      waitBeforeStart: Duration(milliseconds: startInMilliseconds),
      position: ActorPosition(
          top: 600.h,
          bottom: -600.h,
          right: 1.h,
          left: -1.h,
          curve: Curves.elasticOut,
          duration: Duration(milliseconds: duration)),
      character: ActorCharacter(
        child: ClipShadowPath(
            shadow: boxShadow,
            clipper: BottomLeftBezierClipper(),
            child: container),
      ),
    )
  ]);
}
