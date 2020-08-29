import 'package:animation_director/animation_director.dart';
import 'package:bonfire_adventures/common/constants/styles.dart';
import 'package:bonfire_adventures/common/utils/period_of_day_greeting.dart';
import 'package:bonfire_adventures/project/application/auth/auth_cubit.dart';
import 'package:bonfire_adventures/project/application/login/login_cubit.dart';
import 'package:bonfire_adventures/project/presentation/auth/widgets/login_page_widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animations/loading_animations.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String group;
  String greeting = getGreeting();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 480, height: 854, allowFontScaling: false);
    final AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);

    return Scaffold(
      body: BlocListener<LoginCubit, LoginState>(
        listener: (BuildContext context, LoginState state) {
          state.map(
              initial: (_) {},
              submitting: (_) {
                Get.snackbar('Trying to login...', 'Please wait a moment',
                    colorText: Colors.white, backgroundColor: Colors.green);
              },
              success: (_) {
                // context.bloc<AuthCubit>().logIn();
                Get.snackbar('Successfully logged in', 'Please wait a second',
                    colorText: Colors.white, backgroundColor: Colors.green);
                authCubit.logIn();
              },
              failure: (state) {
                Get.snackbar('An Error Occurred', '${state.failure}',
                    colorText: Colors.white,
                    backgroundColor: Color(0xFFFD9726));
              });
        },
        child: Stack(children: [
          AnimationDirector(
            repeatTimes: 1,
            speed: 2,
            autoStart: true,
            group: group,
            onCompleted: (int repeated, Duration runtime) {
              print(
                  "FINISHED - REPEATED $repeated in ${runtime.inMilliseconds}");
            },
            cast: <ActorWidget>[
              backGround(context: context),
              bottomCurve(
                  context: context, startInMilliseconds: 50, duration: 1500),
              greetingText(
                  context: context,
                  startInMilliseconds: 250,
                  duration: 1500,
                  greeting: greeting),
              topCurve(
                  context: context, startInMilliseconds: 150, duration: 1500),
              loginWithGoogle(
                  context: context, startInMilliseconds: 700, duration: 1500),
              orText(
                  context: context, startInMilliseconds: 900, duration: 1500),
              loginWithFacebook(
                  context: context, startInMilliseconds: 500, duration: 1500),
            ],
          ),
          BlocBuilder<LoginCubit, LoginState>(
            builder: (context, state) {
              return state.map(
                initial: (_) => Container(),
                submitting: (_) => Positioned(
                  bottom: 175.h,
                  left: Get.width / 2 - 27.5.h,
                  child: Center(
                    child: LoadingBouncingGrid.circle(
                      size: 55.h,
                      backgroundColor: kBackgroundColor,
                      inverted: true,
                    ),
                  ),
                ),
                success: (_) => Container(),
                failure: (_) => Container(),
              );
            },
          ),
        ]),
      ),
    );
  }
}
