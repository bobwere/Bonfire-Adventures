import 'package:bonfire_adventures/app.dart';
import 'package:bonfire_adventures/common/config/cubit_observer.dart';
import 'package:bonfire_adventures/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  configureInjection();
  await SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(App());
}
