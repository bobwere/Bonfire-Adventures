import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const kBackgroundColor = Color(0xFF2B5740);
const kGrayColor = Color(0xFFCFCFD1);
const gradientTopColor = Color(0xFF80EBA8);
const gradientBottomColor = Color(0xFF2B5740);
const kShadowColor = Color(0xFFA5D6C4);

const kColor = Color(0xFFFB9057);
const kColorDark = Color(0xFFF65E39);
const kColorDarke = Color(0xFFFE7762);

final kLoginButtonStyle = ParentStyle()
  ..margin(horizontal: 20.h)
  ..height(80.h)
  ..ripple(true)
  ..width(double.infinity)
  ..borderRadius(all: 50.h)
  ..background.color(kBackgroundColor)
  ..boxShadow(
    color: kShadowColor,
    offset: Offset(1.h, -5.h),
    blur: 10.h,
    spread: 5.h,
  )
  ..boxShadow(
    color: kShadowColor,
    offset: Offset(3.h, 3.h),
    blur: 10.h,
    spread: 5.h,
  );

final kLoginButtonTextStyle = TxtStyle()
  ..fontFamily('Poppins')
  ..fontSize(27.sp)
  ..textColor(Colors.white)
  ..fontWeight(FontWeight.w800)
  ..alignment.center();

final kLoginGreetingTextStyle = TxtStyle()
  ..fontFamily('Poppins')
  ..fontSize(40.sp)
  ..bold(true)
  ..textColor(Colors.black)
  ..fontWeight(FontWeight.w900);

final kHomePageDiscoverTxtStyle = TxtStyle()
  ..fontFamily('Gotham')
  ..fontWeight(FontWeight.w800)
  ..fontSize(35.sp)
  ..padding(horizontal: 20.h)
  ..textColor(Colors.black87);

final kCategoryChipStyle = TxtStyle()
  ..textColor(Colors.grey)
  ..fontFamily('Poppins')
  ..fontSize(15.sp)
  ..fontWeight(FontWeight.w700)
  ..padding(all: 10.h, left: 0.h, right: 20.h);

final kFeaturedTextStyle = TxtStyle()
  ..fontFamily('Poppins')
  ..fontSize(20.sp)
  ..textColor(Colors.black87)
  ..fontWeight(FontWeight.w800)
  ..alignment.centerLeft()
  ..padding(bottom: 15.h);

final kSeeAllTextStyle = TxtStyle()
  ..fontFamily('Poppins')
  ..fontSize(18.sp)
  ..textColor(Colors.grey)
  ..fontWeight(FontWeight.w700)
  ..alignment.centerLeft()
  ..padding(bottom: 15.h);

final kDestinationCardStyle = ParentStyle()
  ..background.color(Colors.white)
  ..height(350.h)
  ..width(250.h)
  ..borderRadius(all: 15.h)
  ..margin(bottom: 15.h, right: 12.5.h)
  ..alignment.centerLeft()
  ..boxShadow(
    color: Colors.grey.shade300,
    offset: Offset(0.h, 3.5.h),
    blur: 3.5.h,
  );
