import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:esusu_savings/constant/error/error.dart';
import 'package:esusu_savings/features/account/domain/user.dart';
import 'package:esusu_savings/features/account/repositry/account_repositry.dart';
import 'package:esusu_savings/features/authenticate/repositries/auth_repositry.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileService {
  final Ref _ref;

  ProfileService(this._ref);

  Future<void> createUserProfile(AppUser user) async {
    try {
      final currentuser = _ref.read(authRepositryProvider).user;
      if (currentuser != null) {
        // do something
        _ref.read(accountRepositryProvider).createUser(currentuser.uid, user);
      } else {
        throw CustomException(
            message: "User have to be logged in to carry out operation");
      }
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message!);
    }
  }

  Stream<AppUser?> getUserProfile() {
    final currentuser = _ref.read(authRepositryProvider).user;
    if (currentuser != null) {
      // do something
      final id = currentuser.uid;
      return _ref.read(accountRepositryProvider).getUser(id);
    }
    return Stream<AppUser>.error(
      CustomException(
          message: "User have to be logged in to carry out operation"),
    );
  }

  Future<void> updateUserProfile(AppUser user) async {
    try {
      final currentuser = _ref.read(authRepositryProvider).user;
      if (currentuser != null) {
        // do something
        _ref.read(accountRepositryProvider).updateUser(currentuser.uid, user);
      } else {
        throw CustomException(
            message: "User have to be logged in to carry out operation");
      }
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message!);
    }
  }
}

final profileServiceProvider = Provider<ProfileService>((ref) {
  return ProfileService(ref);
});

final userProfileProvider = StreamProvider<AppUser?>((ref) {
  return ref.read(profileServiceProvider).getUserProfile();
});
