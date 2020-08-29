import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../common/constants/strings.dart';
import '../../domain/auth/entities/user.dart';
import '../../domain/auth/interfaces/i_auth_facade.dart';

part 'auth_cubit.freezed.dart';
part 'auth_state.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._iAuthFacade) : super(AuthState.uninitialized());

  final IAuthFacade _iAuthFacade;

  void appStarted() async {
    final userOption = await _iAuthFacade.getSignedInUser();

    final prefs = await SharedPreferences.getInstance();
    final value = prefs.getBool(onboardingPageSeen) ?? false;

    //time for splash screen to play
    await Future.delayed(Duration(seconds: 6));

    if (!value) {
      emit(AuthState.onboarding());
    } else {
      userOption.fold(() => emit(AuthState.unauthenticated()),
          (user) => emit(AuthState.authenticated(user)));
    }
  }

  void logIn() async {
    final userOption = await _iAuthFacade.getSignedInUser();
    final user = userOption.getOrElse(() => null);
    emit(AuthState.authenticated(user));
  }

  void logOut() async {
    await _iAuthFacade.signOut();
    emit(AuthState.unauthenticated());
  }
}
