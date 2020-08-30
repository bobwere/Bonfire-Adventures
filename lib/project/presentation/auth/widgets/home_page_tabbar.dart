import 'package:bonfire_adventures/common/constants/styles.dart';
import 'package:bonfire_adventures/project/presentation/auth/pages/Experiences_tab.dart';
import 'package:flutter/material.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';
import 'package:flutter/cupertino.dart';

class HomePageTabBar extends StatefulWidget {
  @override
  _HomePageTabBarState createState() => _HomePageTabBarState();
}

class _HomePageTabBarState extends State<HomePageTabBar>
    with TickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        TabBar(
          controller: _controller,
          indicator: DotIndicator(
            color: kBackgroundColor,
            distanceFromCenter: 16,
            radius: 3,
            paintingStyle: PaintingStyle.fill,
          ),
          indicatorColor: kBackgroundColor,
          labelColor: kBackgroundColor,
          labelStyle:
              TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.w700),
          unselectedLabelColor: CupertinoColors.systemGrey,
          isScrollable: true,
          tabs: <Widget>[
            Tab(
              text: "Popular",
            ),
            Tab(
              text: "Experiences",
            ),
            Tab(
              text: "Sights",
            ),
            Tab(
              text: "Housings",
            ),
          ],
        ),
        Container(
          height: screenHeight * 0.70,
          child: TabBarView(
            controller: _controller,
            children: <Widget>[
              ExperiencesTab(),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.orangeAccent,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.greenAccent,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.greenAccent,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
