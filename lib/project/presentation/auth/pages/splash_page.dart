import 'package:animation_director/animation_director.dart';
import 'package:bonfire_adventures/project/presentation/auth/widgets/splash_page_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  String group;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 480, height: 854, allowFontScaling: false);

    return Scaffold(
      body: AnimationDirector(
          repeatTimes: 1,
          speed: 2,
          autoStart: true,
          group: group,
          onCompleted: (int repeated, Duration runtime) {
            print("FINISHED - REPEATED $repeated in ${runtime.inMilliseconds}");
          },
          cast: <ActorWidget>[
            backGround(context: context),
            bottomCurve(
                context: context, startInMilliseconds: 50, duration: 1500),
            topOvalShape(
                context: context, startInMilliseconds: 350, duration: 1500),
            topCurve(
                context: context, startInMilliseconds: 350, duration: 1500),
            bottomLeftCurve(
                context: context, startInMilliseconds: 150, duration: 1500),
            logo(context: context, startInMilliseconds: 600, duration: 1500),
            loadingAnimation(
                context: context,
                startInMilliseconds: 1700,
                opacityStartInMilliseconds: 1500,
                duration: 800)
          ]),
    );
  }
}
