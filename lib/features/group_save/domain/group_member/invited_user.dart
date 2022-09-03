import 'package:freezed_annotation/freezed_annotation.dart';

part 'invited_user.freezed.dart';
part 'invited_user.g.dart';

@freezed
class InvitedUser with _$InvitedUser {
  const factory InvitedUser(
      {required String user_id,
      required String username,
      required String photoUrl}) = _InvitedUser;

  factory InvitedUser.fromJson(Map<String, dynamic> json) =>
      _$InvitedUserFromJson(json);
}
