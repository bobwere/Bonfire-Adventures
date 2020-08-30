import 'package:bonfire_adventures/common/constants/strings.dart';
import 'package:bonfire_adventures/common/constants/styles.dart';
import 'package:bonfire_adventures/project/application/auth/auth_cubit.dart';
import 'package:bonfire_adventures/project/presentation/auth/widgets/home_page_tabbar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dart_random_choice/dart_random_choice.dart';

class HomePage extends StatelessWidget {
  final BuildContext menuScreenContext;
  final Function onScreenHideButtonPressed;
  final bool hideStatus;
  const HomePage(
      {Key key,
      this.menuScreenContext,
      this.onScreenHideButtonPressed,
      this.hideStatus = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 480, height: 854, allowFontScaling: true);
    return Scaffold(
      body: ListView(
          padding: EdgeInsets.zero,
          scrollDirection: Axis.vertical,
          children: [
            SizedBox(height: 50.h),
            GreetingAndProfilePicRow(),
            SizedBox(height: 10.h),
            Txt('Discover', style: kHomePageDiscoverTxtStyle),
            HomePageTabBar(),
          ]),
    );
  }
}

class GreetingAndProfilePicRow extends StatelessWidget {
  const GreetingAndProfilePicRow({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
        builder: (context, AuthState state) {
      return state.maybeMap(
          authenticated: (state) {
            final name = state.user.name;
            final picUrl = state.user.photoUrl;
            Color backgroundColor;
            String initialLetter;
            String firstName;
            List<String> strings = name.split(" ");
            firstName = strings[0];
            if (picUrl == null) {
              backgroundColor = randomChoice<Color>(randomAvatarColor);
              initialLetter = name[0].toUpperCase();
            }
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Txt("Hi $firstName,",
                      style: TxtStyle()
                        ..fontFamily('Gotham')
                        ..fontWeight(FontWeight.w700)
                        ..fontSize(27.sp)
                        ..textColor(Colors.black87)),
                  Parent(
                    style: ParentStyle()
                      ..height(40.h)
                      ..width(40.h)
                      ..borderRadius(all: 12.h)
                      ..background.color(backgroundColor)
                      ..background.image(url: picUrl ?? ''),
                    child: picUrl == null
                        ? Center(child: Text("$initialLetter"))
                        : Container(),
                  ),
                ],
              ),
            );
          },
          orElse: () => Text(''));
    });
  }
}
