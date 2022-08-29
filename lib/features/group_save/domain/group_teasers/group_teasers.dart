import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'group_teasers.freezed.dart';
part 'group_teasers.g.dart';

@freezed
class GroupTeaser with _$GroupTeaser {
  const GroupTeaser._();

  factory GroupTeaser(
      {String? id,
      required String groupId,
      required String authorId,
      @Default([]) List members,
      required String name}) = _GroupTeaser;

  factory GroupTeaser.fromJson(Map<String, dynamic> json) =>
      _$GroupTeaserFromJson(json);

  static GroupTeaser fromDocuments(
      QueryDocumentSnapshot<Map<String, dynamic>> doc) {
    final id = doc.id;
    return GroupTeaser.fromJson({"id": id, ...doc.data()});
  }
}
