import 'package:bonfire_adventures/common/constants/styles.dart';
import 'package:bonfire_adventures/project/presentation/auth/widgets/destination_card.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FeaturedDestinationHorizontalListView extends StatelessWidget {
  const FeaturedDestinationHorizontalListView({
    Key key,
  }) : super(key: key);

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
              Txt('Featured Destinations', style: kFeaturedTextStyle),
              Txt('See all', style: kSeeAllTextStyle),
            ],
          ),
        ),

        //Horizontal ListView
        SizedBox(
          height: 380.h,
          child: ListView(
            padding: EdgeInsets.only(left: 20.h, right: 8.5),
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              DestinationCard(),
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
