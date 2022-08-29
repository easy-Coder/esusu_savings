import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:esusu_savings/constant/general_providers.dart';
import 'package:esusu_savings/features/account/domain/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AccountRepositry {
  final FirebaseFirestore _firestore;

  AccountRepositry(this._firestore);

  Future<void> createUser(String id, AppUser user) async {
    await _firestore.collection("user").doc(id).set(user.toJson());
  }

  Stream<AppUser?> getUser(String id) {
    final result = _firestore.collection("user").doc(id).snapshots();
    return result.map((event) => AppUser.fromDocument(event));
  }

  Future<void> updateUser(String id, AppUser user) async {
    await _firestore.collection("user").doc(id).update(user.toJson());
  }

  Future uploadPics(File file) async {
    // upload image and return the url.
    throw UnimplementedError();
  }
}

final accountRepositryProvider = Provider<AccountRepositry>(
  (ref) {
    return AccountRepositry(ref.read(fireStoreProvider));
  },
);


