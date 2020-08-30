import 'package:bonfire_adventures/common/constants/styles.dart';
import 'package:bonfire_adventures/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeWidget extends StatefulWidget {
  final BuildContext menuScreenContext;
  const HomeWidget({Key key, this.menuScreenContext}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  PersistentTabController _controller;
  bool _hideNavBar;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
    _hideNavBar = false;
  }

  List<Widget> _buildScreens() {
    return [
      HomePage(
        menuScreenContext: widget.menuScreenContext,
        hideStatus: _hideNavBar,
        onScreenHideButtonPressed: () {
          setState(() {
            _hideNavBar = !_hideNavBar;
          });
        },
      ),
      Container(color: Colors.redAccent),
      Container(color: Colors.orangeAccent),
      Container(color: Colors.greenAccent),
    ];
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 480, height: 854, allowFontScaling: true);
    return PersistentTabView(
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      hideNavigationBar: _hideNavBar,
      decoration: NavBarDecoration(colorBehindNavBar: Colors.white, boxShadow: [
        BoxShadow(
          color: Colors.grey,
          offset: Offset(-1.0, 0.0),
          blurRadius: 2,
        )
      ]),
      popAllScreensOnTapOfSelectedTab: true,
      itemAnimationProperties: ItemAnimationProperties(
        duration: Duration(milliseconds: 400),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style12, // Choose the nav bar style with this property
    );
  }
}

List<PersistentBottomNavBarItem> _navBarsItems() {
  return [
    PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.home),
        title: ("Home"),
        activeColor: kBackgroundColor,
        inactiveColor: CupertinoColors.systemGrey),
    PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.search),
        title: ("Search"),
        activeColor: kBackgroundColor,
        inactiveColor: CupertinoColors.systemGrey),
    PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.heart),
        title: ("Favourites"),
        activeColor: kBackgroundColor,
        inactiveColor: CupertinoColors.systemGrey),
    PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.profile_circled),
        title: ("Profile"),
        activeColor: kBackgroundColor,
        inactiveColor: CupertinoColors.systemGrey),
  ];
}
