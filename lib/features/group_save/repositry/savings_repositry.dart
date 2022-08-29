import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:esusu_savings/constant/general_providers.dart';
import 'package:esusu_savings/features/group_save/domain/group/group.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SavingsPlans {
  final FirebaseFirestore _firestore;

  const SavingsPlans(this._firestore);

  Future<void> addSavingsPlan(Group data) async {
    await _firestore.collection('groups').add(data.toJson());
  }

  Stream<Group> getGroupPlan(String group_id) {
    return _firestore
        .collection('groups')
        .doc(group_id)
        .snapshots()
        .map((doc) => Group.fromDocument(doc));
  }

  Future<void> updateSavingsPlan(Group data) async {
    await _firestore
        .collection("groups")
        .doc(data.id)
        .set(data.toJson()..remove("id"));
  }

  Future<void> removeSavignsPlan(Group data) async {
    await _firestore.collection("groups").doc(data.id).delete();
  }
}

final savingsPlanProvider = Provider<SavingsPlans>((ref) {
  return SavingsPlans(ref.read(fireStoreProvider));
});
