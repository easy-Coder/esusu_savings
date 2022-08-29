import 'package:esusu_savings/constant/error/error.dart';
import 'package:esusu_savings/features/authenticate/repositries/auth_repositry.dart';
import 'package:esusu_savings/features/group_save/domain/group/group.dart';
import 'package:esusu_savings/features/group_save/repositries/savings_repositry.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GroupSaveService {
  final Ref _ref;

  GroupSaveService(this._ref);

  Future<void> createGroupPlan(Group group) async {
    try {
      final user = _ref.read(authRepositryProvider).user;
      if (user != null) {
        final group_id = await _ref.read(savingsPlanProvider).addSavingsPlan(group);
      } else {
        throw CustomException(message: "You are not logged in.");
      }
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message!);
    }
  }
}
