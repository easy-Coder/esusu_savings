import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:esusu_savings/features/group_save/domain/group.dart';

class SavingsPlans {
  final FirebaseFirestore _firestore;

  const SavingsPlans(this._firestore);

  Future<void> addSavingsPlan(Group data) async {
    await _firestore.collection('groups').add(data.toJson());
  }

  Stream<List<Group>> getUserSavingsPlans(String user) {
    return _firestore
        .collection('groups')
        .where("members", arrayContains: user)
        .snapshots()
        .map((doc) => doc.docs.map((e) => Group.fromDocument(e)).toList());
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
