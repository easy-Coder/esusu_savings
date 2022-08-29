import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

final now = DateTime.now();

@freezed
class AppUser with _$AppUser {
  const AppUser._();
  const factory AppUser({
    required String id,
    required String username,
    @JsonKey(name: "first_name") required String firstName,
    required String surname,
    required String bvn,
    @JsonKey(name: "profile_pics") required String? profilePics,
    @JsonKey(name: "date_created") DateTime? dateCreated,
  }) = _AppUser;

  factory AppUser.fromJson(Map<String, dynamic> json) =>
      _$AppUserFromJson(json);

  static AppUser fromDocument(
      DocumentSnapshot<Map<String, dynamic>> documentSnapshot) {
    return AppUser.fromJson(documentSnapshot.data()!);
  }
}
