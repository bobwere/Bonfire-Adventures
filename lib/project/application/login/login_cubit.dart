import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../common/constants/strings.dart';
import '../../domain/auth/interfaces/i_auth_facade.dart';

part 'login_cubit.freezed.dart';
part 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._iAuthFacade) : super(LoginState.initial());

  final IAuthFacade _iAuthFacade;

  void loginWithGooglePressed() async {
    emit(LoginState.submitting());
    var possibleOutcomes = await _iAuthFacade.signInWithGoogle();
    possibleOutcomes.fold(
        (f) => emit(LoginState.failure(f.map(
              cancelledByUser: (_) => CANCELED_BY_USER_MESSAGE,
              serverError: (_) => SERVER_ERROR_MESSAGE,
              noInternet: (_) => NO_INTERNET_MESSAGE,
            ))),
        (_) => emit(LoginState.success()));
  }

  void loginWithFacebookPressed() async {
    emit(LoginState.submitting());
    var possibleOutcomes = await _iAuthFacade.signInWithFacebook();
    possibleOutcomes.fold(
        (f) => emit(LoginState.failure(f.map(
              cancelledByUser: (_) => CANCELED_BY_USER_MESSAGE,
              serverError: (_) => SERVER_ERROR_MESSAGE,
              noInternet: (_) => NO_INTERNET_MESSAGE,
            ))),
        (user) => emit(LoginState.success()));
  }
}
