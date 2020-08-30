import 'package:bonfire_adventures/project/presentation/auth/widgets/featured_destination_horizontal_listview.dart';
import 'package:bonfire_adventures/project/presentation/auth/widgets/popular_destination_horizontal_listview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class ExperiencesTab extends StatefulWidget {
  ExperiencesTab({Key key}) : super(key: key);

  @override
  _ExperiencesTabState createState() => _ExperiencesTabState();
}

class _ExperiencesTabState extends State<ExperiencesTab> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(bottom: 40.h),
      child: Column(
        children: [
          PopularDestinationHorizontalListView(),
          FeaturedDestinationHorizontalListView()
        ],
      ),
    );
  }
}
