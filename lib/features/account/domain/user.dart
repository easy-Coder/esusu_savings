import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class AppUser with _$AppUser {
  const AppUser._();
  const factory AppUser({
    String? id,
    required String firstName,
    required String surname,
    required String bvn,
    required String address,
    required String state,
    required String? profilePics,
    required DateTime dateCreated,
  }) = _AppUser;

  factory AppUser.fromJson(Map<String, dynamic> json) =>
      _$AppUserFromJson(json);

  static AppUser fromDocument(
      DocumentSnapshot<Map<String, dynamic>> documentSnapshot) {
    final user_id = documentSnapshot.id;

    return AppUser.fromJson({'id': user_id, ...documentSnapshot.data()!});
  }
}
