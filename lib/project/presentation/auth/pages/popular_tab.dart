import 'package:bonfire_adventures/project/presentation/auth/widgets/featured_destination_horizontal_listview.dart';
import 'package:bonfire_adventures/project/presentation/auth/widgets/popular_destination_horizontal_listview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class PopularTab extends StatefulWidget {
  PopularTab({Key key}) : super(key: key);

  @override
  _PopularTabState createState() => _PopularTabState();
}

class _PopularTabState extends State<PopularTab> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(bottom: 40.h),
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Image.asset("assets/images/banners/yellow_book_a_trip.png"),
          ),
          PopularDestinationHorizontalListView(),
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Image.asset("assets/images/banners/green_sands_banner.png"),
          ),
          FeaturedDestinationHorizontalListView()
        ],
      ),
    );
  }
}
