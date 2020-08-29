import 'package:bonfire_adventures/common/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../common/utils/gooey_edge/gooey_edge_onborading_page/content_card.dart';
import '../../../../common/utils/gooey_edge/gooey_edge_onborading_page/gooey_carousel.dart';

class GooeyEdgeOnboardingPage extends StatefulWidget {
  const GooeyEdgeOnboardingPage({
    Key key,
  }) : super(key: key);

  @override
  _GooeyEdgeOnboardingPageState createState() =>
      _GooeyEdgeOnboardingPageState();
}

class _GooeyEdgeOnboardingPageState extends State<GooeyEdgeOnboardingPage> {
  @override
  void initState() {
    onboardinPageIsSeen();
    super.initState();
  }

  void onboardinPageIsSeen() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(onboardingPageSeen, true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GooeyCarousel(
        children: <Widget>[
          ContentCard(
            color: 'Red',
            altColor: Color(0xFF4259B2),
            title: "Find your Destination",
            subtitle: 'Discover and explore awesome places.',
          ),
          ContentCard(
            color: 'Yellow',
            altColor: Color(0xFF904E93),
            title: "Booking your Ticket",
            subtitle: 'Book your ticket in less than a minute.',
          ),
          ContentCard(
            color: 'Blue',
            altColor: Color(0xFFFFB138),
            title: "Enjoy your Holiday",
            subtitle: 'Enjoy a relaxing holiday and share your experience.',
          ),
        ],
      ),
    );
  }
}
