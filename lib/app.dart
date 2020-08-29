import 'package:bonfire_adventures/common/constants/strings.dart';
import 'package:bonfire_adventures/common/routes/routes.dart';
import 'package:bonfire_adventures/injection_container.dart';
import 'package:bonfire_adventures/project/application/auth/auth_cubit.dart';
import 'package:bonfire_adventures/project/application/login/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(create: (_) => sl<AuthCubit>()..appStarted()),
        BlocProvider(create: (_) => sl<LoginCubit>()),
      ],
      child: GetMaterialApp(
          title: nameOfApp,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          initialRoute: '/',
          getPages: Routes.routes),
    );
  }
}
