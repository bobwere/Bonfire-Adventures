// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/get_it_helper.dart';

import 'common/config/firebase_injectable_module.dart';
import 'project/application/auth/auth_cubit.dart';
import 'project/application/login/login_cubit.dart';
import 'project/domain/auth/interfaces/i_auth_facade.dart';
import 'project/infrastructure/auth/mappers/firebase_user_mapper.dart';
import 'project/infrastructure/auth/repositories/firebase_auth_facade.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

void $initGetIt(GetIt g, {String environment}) {
  final gh = GetItHelper(g, environment);
  final firebaseInjectableModule = _$FirebaseInjectableModule();
  gh.lazySingleton<FacebookLogin>(() => firebaseInjectableModule.facebookLogin);
  gh.lazySingleton<FirebaseAuth>(() => firebaseInjectableModule.firebaseAuth);
  gh.lazySingleton<FirebaseUserMapper>(() => FirebaseUserMapper());
  gh.lazySingleton<Firestore>(() => firebaseInjectableModule.firestore);
  gh.lazySingleton<GoogleSignIn>(() => firebaseInjectableModule.googleSignIn);
  gh.lazySingleton<IAuthFacade>(() => FirebaseAuthFacade(
        g<FirebaseAuth>(),
        g<GoogleSignIn>(),
        g<FirebaseUserMapper>(),
        g<Firestore>(),
        g<FacebookLogin>(),
      ));
  gh.factory<LoginCubit>(() => LoginCubit(g<IAuthFacade>()));
  gh.factory<AuthCubit>(() => AuthCubit(g<IAuthFacade>()));
}

class _$FirebaseInjectableModule extends FirebaseInjectableModule {}
