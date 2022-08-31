import 'package:esusu_savings/constant/error/error.dart';
import 'package:esusu_savings/features/authenticate/repositries/auth_repositry.dart';
import 'package:esusu_savings/features/group_save/domain/group/group.dart';
import 'package:esusu_savings/features/group_save/domain/group_teasers/group_teasers.dart';
import 'package:esusu_savings/features/group_save/repositries/savings_repositry.dart';
import 'package:esusu_savings/features/group_save/repositries/teaser_repositry.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GroupSaveService {
  final Ref _ref;

  GroupSaveService(this._ref);

  Stream<List<GroupTeaser?>> getUsersGroup() {
    try {
      final user = _ref.read(authRepositryProvider).user;
      if (user != null) {
        return _ref
            .read(groupTeaserProvider)
            .getAllGroupTeaserForUser(user.uid);
      } else {
        throw CustomException(message: "You have to be logged in.");
      }
    } on FirebaseException catch (error) {
      throw CustomException(message: error.message!);
    }
  }

  Future<void> createGroupPlan(Group group) async {
    try {
      final user = _ref.read(authRepositryProvider).user;
      if (user != null) {
        final group_id =
            await _ref.read(savingsPlanProvider).addSavingsPlan(group);
        _ref.read(groupTeaserProvider).createGroupTeaser(
              GroupTeaser(
                groupId: group_id,
                authorId: user.uid,
                name: group.name,
                members: group.members,
              ),
            );
      } else {
        throw CustomException(message: "You are not logged in.");
      }
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message!);
    }
  }

  Stream<Group> getGroup(GroupTeaser teaser) {
    try {
      return _ref.read(savingsPlanProvider).getGroupPlan(teaser.groupId);
    } on FirebaseException catch (error) {
      throw CustomException(message: error.message!);
    }
  }

  Future<void> updateGroup(Group group) async {
    try {
      final teaser = GroupTeaser(
        groupId: group.id!,
        authorId: group.author,
        name: group.name,
        members: group.members,
      );
      _ref.read(savingsPlanProvider).updateSavingsPlan(group);
      _ref.read(groupTeaserProvider).updateGroupTeaser(teaser);
    } on FirebaseException catch (error) {
      throw CustomException(message: error.message!);
    }
  }

  Future<void> deleteGroup(Group group) async {
    final teaser = GroupTeaser(
      groupId: group.id!,
      authorId: group.author,
      name: group.name,
      members: group.members,
    );
    await _ref.read(savingsPlanProvider).removeSavignsPlan(group);
    await _ref.read(groupTeaserProvider).deleteGroupTeaser(teaser);
  }
}

final groupSavingsServiceProvider = Provider<GroupSaveService>((ref) {
  return GroupSaveService(ref);
});

final groupStreamProvider = StreamProvider<List<GroupTeaser?>>((ref) {
  return ref.read(groupSavingsServiceProvider).getUsersGroup();
});
