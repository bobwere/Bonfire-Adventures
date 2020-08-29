import 'package:bonfire_adventures/common/failures/auth_failure.dart';
import 'package:bonfire_adventures/common/failures/user_failure.dart';
import 'package:bonfire_adventures/project/domain/auth/entities/user.dart';
import 'package:dartz/dartz.dart';

abstract class IAuthFacade {
  Future<Option<User>> getSignedInUser();
  Future<Either<AuthFailure, User>> signInWithFacebook();
  Future<Either<AuthFailure, User>> signInWithGoogle();
  Future<Either<UserFailure, User>> getUser(String id);
  Future<void> signOut();
}
