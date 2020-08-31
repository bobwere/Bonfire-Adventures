import 'package:flutter/material.dart';

String getGreeting() {
  DayPeriod time = TimeOfDay.now().period;
  if (time.toString() == 'DayPeriod.am') {
    return 'Good Morning,\nJoin millions of tourists\nfind exciting destinations';
  } else {
    return 'Good Evening,\nJoin millions of tourists\nfind exciting destinations';
  }
}
