import 'package:bonfire_adventures/common/constants/strings.dart';
import 'package:bonfire_adventures/common/constants/styles.dart';
import 'package:bonfire_adventures/project/application/auth/auth_cubit.dart';
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
            CategoryHorizontalListView(),
            Center(
              child: RaisedButton(
                color: Colors.purpleAccent,
                onPressed: () {
                  this.onScreenHideButtonPressed();
                },
                child: Text(
                  this.hideStatus
                      ? "Unhide Navigation Bar"
                      : "Hide Navigation Bar",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Txt("Hi $firstName,",
                      style: TxtStyle()
                        ..fontFamily('Gotham')
                        ..fontWeight(FontWeight.w700)
                        ..fontSize(27.sp)
                        ..textColor(Colors.black87)),
                  CircleAvatar(
                    radius: 20.h,
                    backgroundColor: backgroundColor,
                    child: picUrl == null
                        ? Center(child: Text("$initialLetter"))
                        : Container(),
                    backgroundImage: NetworkImage(picUrl ?? ''),
                  )
                ],
              ),
            );
          },
          orElse: () => Text(''));
    });
  }
}

class CategoryHorizontalListView extends StatelessWidget {
  const CategoryHorizontalListView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      child: ListView(
        padding: EdgeInsets.only(left: 20.h),
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          for (var categoryName in categories) categoryChip(categoryName)
        ],
      ),
    );
  }
}

Widget categoryChip(String name) {
  return Builder(
    builder: (context) {
      return Parent(
        child: Container(
          height: 70.h,
          child: Center(
            child: Txt(name, style: kCategoryChipStyle),
          ),
        ),
      );
    },
  );
}

class DestinationHorizontalListView extends StatelessWidget {
  const DestinationHorizontalListView({Key key, @required this.categoryName})
      : super(key: key);

  final String categoryName;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 480, height: 854, allowFontScaling: true);
    return Column(
      children: <Widget>[
        //Row Name and See All Text
        Padding(
          padding: EdgeInsets.fromLTRB(20.h, 10.h, 20.h, 20.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Txt('Popular Destinations', style: kFeaturedTextStyle),
              Txt('See all', style: kSeeAllTextStyle),
            ],
          ),
        ),

        //Horizontal ListView
        SizedBox(
          height: 300.h,
          child: ListView(
            padding: EdgeInsets.only(left: 20.h),
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              DestinationCard(),
              DestinationCard(),
              DestinationCard(),
            ],
          ),
        ),
      ],
    );
  }
}

class DestinationCard extends StatefulWidget {
  const DestinationCard({Key key}) : super(key: key);

  @override
  _DestinationCardState createState() => _DestinationCardState();
}

class _DestinationCardState extends State<DestinationCard> {
  @override
  Widget build(BuildContext context) {
    return Parent(
      style: kDestinationCardStyle,
      child: Column(children: [
        //Image from database
        Parent(
          child: ClipRRect(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(15.h),
                topLeft: Radius.circular(15.h)),
            child: SizedBox(
              width: 210.h,
              height: 210.h,
              child: CachedNetworkImage(
                fadeOutDuration: const Duration(milliseconds: 500),
                fadeInDuration: const Duration(milliseconds: 500),
                imageUrl:
                    'https://cdn.shortpixel.ai/client/q_glossy,ret_img/http://www.bonfireadventures.com/new/wp-content/uploads/2019/01/bonfire-maldives-400x260.jpg',
                errorWidget: (context, url, error) => Icon(Icons.error),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),

        Spacer(),

        //Product Name
        Txt('Seychelles Tour'),

        //Row of Price & Favorite Icon
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Txt(
              'Ksh 1500',
            ),
          ],
        ),
      ]),
    );
  }
}
