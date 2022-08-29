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
        _ref.read(accountRepositryProvider).createUser(user);
      } else {
        throw CustomException(
            message: "User have to be logged in to carry out operation");
      }
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message!);
    }
  }

  Stream<AppUser> getUserProfile(String user_id) {
    final currentuser = _ref.read(authRepositryProvider).user;
    if (currentuser != null) {
      // do something
      return _ref.read(accountRepositryProvider).getUser(user_id);
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
        _ref.read(accountRepositryProvider).updateUser(user);
      } else {
        throw CustomException(
            message: "User have to be logged in to carry out operation");
      }
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message!);
    }
  }
}
