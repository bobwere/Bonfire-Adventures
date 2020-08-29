import 'package:flutter/material.dart';

String getGreeting() {
  DayPeriod time = TimeOfDay.now().period;
  if (time.toString() == 'DayPeriod.am') {
    return 'Good Morning';
  } else {
    return 'Good Evening';
  }
}
