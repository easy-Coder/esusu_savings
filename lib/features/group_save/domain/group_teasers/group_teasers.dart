import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:esusu_savings/constant/enum.dart';
import 'package:esusu_savings/features/group_save/domain/group_member/invited_user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'group_teasers.freezed.dart';
part 'group_teasers.g.dart';

@freezed
class GroupTeaser with _$GroupTeaser {
  const GroupTeaser._();

  factory GroupTeaser(
      {String? id,
      required String groupId,
      required GroupsType type,
      required String authorId,
      @Default({}) Map<String, InvitedUser?> members,
      required String name}) = _GroupTeaser;

  factory GroupTeaser.fromJson(Map<String, dynamic> json) =>
      _$GroupTeaserFromJson(json);

  static GroupTeaser fromDocuments(
      QueryDocumentSnapshot<Map<String, dynamic>> doc) {
    final id = doc.id;
    return GroupTeaser.fromJson({"id": id, ...doc.data()});
  }
}
