import 'package:bonfire_adventures/project/domain/auth/entities/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class FirebaseUserMapper {
  User toDomain(FirebaseUser user) {
    return user == null
        ? null
        : User(
            id: user.uid,
            name: user.displayName,
            emailAddress: user.email,
            contact: user.phoneNumber,
            photoUrl: user.photoUrl,
          );
  }
}
