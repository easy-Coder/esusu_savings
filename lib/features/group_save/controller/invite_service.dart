import 'package:esusu_savings/features/authenticate/repositries/auth_repositry.dart';
import 'package:esusu_savings/features/group_save/domain/group_member/invited_user.dart';
import 'package:esusu_savings/features/group_save/repositries/savings_repositry.dart';
import 'package:esusu_savings/features/group_save/repositries/teaser_repositry.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InviteService {
  final Ref _ref;

  InviteService(this._ref);

  Future<void> inviteUserToGroup(
      String group_id, InvitedUser invitedUser) async {
    try {
      final user = _ref.read(authRepositryProvider).user;
      if (user != null) {
        final group =
            await _ref.read(savingsPlanProvider).getGroupPlan(group_id).first;
        await _ref
            .read(savingsPlanProvider)
            .updateSavingsPlan(group..members.add(invitedUser));
        final groupteaser = await _ref
            .read(groupTeaserProvider)
            .getGroupTeaserByGroup(group_id);
        await _ref.read(groupTeaserProvider).updateGroupTeaser(
            groupteaser!..members.addAll({invitedUser.user_id: invitedUser}));
      }
    } catch (error) {}
  }
}
