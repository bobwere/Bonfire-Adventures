part of 'login_cubit.dart';

@freezed
abstract class LoginState with _$LoginState {
  const factory LoginState.initial() = Initial;
  const factory LoginState.submitting() = Submitting;
  const factory LoginState.success() = Success;
  const factory LoginState.failure(String failure) = Failure;
}
