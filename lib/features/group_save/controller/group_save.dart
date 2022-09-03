import 'package:esusu_savings/constant/error/error.dart';
import 'package:esusu_savings/features/account/repositry/account_repositry.dart';
import 'package:esusu_savings/features/authenticate/repositries/auth_repositry.dart';
import 'package:esusu_savings/features/group_save/domain/group/group.dart';
import 'package:esusu_savings/features/group_save/domain/group_member/invited_user.dart';
import 'package:esusu_savings/features/group_save/domain/group_teasers/group_teasers.dart';
import 'package:esusu_savings/features/group_save/repositries/savings_repositry.dart';
import 'package:esusu_savings/features/group_save/repositries/teaser_repositry.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
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
        final user_profile =
            await _ref.read(accountRepositryProvider).getUser(user.uid).first;
        final admin = InvitedUser(
            user_id: user.uid,
            username: user.displayName ?? 'testuser',
            photoUrl: user_profile?.profilePics ?? '');
        final newgroup = Group(
            name: group.name,
            totalParticipant: group.totalParticipant,
            author: group.author,
            savingAmount: group.savingAmount,
            type: group.type,
            members: [admin]);
        final group_id =
            await _ref.read(savingsPlanProvider).addSavingsPlan(newgroup);
        _ref.read(groupTeaserProvider).createGroupTeaser(
              GroupTeaser(
                groupId: group_id,
                authorId: user.uid,
                type: group.type,
                name: group.name,
                members: {user.uid: admin},
              ),
            );
      } else {
        throw CustomException(message: "You are not logged in.");
      }
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message!);
    } catch (e) {
      debugPrint(e.toString());
      throw CustomException(message: e.toString());
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
      final teaser =
          await _ref.read(groupTeaserProvider).getGroupTeaserByGroup(group.id!);
      _ref.read(savingsPlanProvider).updateSavingsPlan(group);
      _ref.read(groupTeaserProvider).updateGroupTeaser(teaser!);
    } on FirebaseException catch (error) {
      throw CustomException(message: error.message!);
    }
  }

  Future<void> deleteGroup(Group group) async {
    final teaser =
        await _ref.read(groupTeaserProvider).getGroupTeaserByGroup(group.id!);
    await _ref.read(savingsPlanProvider).removeSavignsPlan(group);
    await _ref.read(groupTeaserProvider).deleteGroupTeaser(teaser!);
  }
}

final groupSavingsServiceProvider = Provider<GroupSaveService>((ref) {
  return GroupSaveService(ref);
});

final groupStreamProvider = StreamProvider<List<GroupTeaser?>>((ref) {
  return ref.read(groupSavingsServiceProvider).getUsersGroup();
});
