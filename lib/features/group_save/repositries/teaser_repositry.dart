import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:esusu_savings/constant/general_providers.dart';
import 'package:esusu_savings/features/group_save/domain/group_teasers/group_teasers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GroupTeaserRepositry {
  final FirebaseFirestore _firestore;

  GroupTeaserRepositry(this._firestore);

  Future<void> createGroupTeaser(GroupTeaser teaser) async {
    await _firestore.collection("group_teaser").add(teaser.toJson());
  }

  Stream<List<GroupTeaser?>> getAllGroupTeaserForUser(String id) {
    final result = _firestore
        .collection("group_teaser")
        .where("members." + id, isNotEqualTo: '')
        .snapshots();
    return result.map((event) =>
        event.docs.map((doc) => GroupTeaser.fromDocuments(doc)).toList());
  }

  Future<GroupTeaser?> getGroupTeaserByGroup(String group_id) async {
    final result = _firestore
        .collection("group_teaser")
        .where("group_id", isEqualTo: group_id)
        .limit(1)
        .snapshots();
    return result
        .map((event) =>
            event.docs.map((doc) => GroupTeaser.fromDocuments(doc)).first)
        .first;
  }

  Future<void> updateGroupTeaser(GroupTeaser teaser) async {
    final id = teaser.toJson().remove("id");
    await _firestore.collection("group_teaser").doc(id).set(teaser.toJson());
  }

  Future<void> deleteGroupTeaser(GroupTeaser teaser) async {
    await _firestore.collection("group_teaser").doc(teaser.id).delete();
  }
}

final groupTeaserProvider = Provider<GroupTeaserRepositry>((ref) {
  return GroupTeaserRepositry(ref.read(fireStoreProvider));
});
