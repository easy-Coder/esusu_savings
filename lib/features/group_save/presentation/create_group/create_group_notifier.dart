import 'package:esusu_savings/features/group_save/controller/group_save.dart';
import 'package:esusu_savings/features/group_save/domain/group/group.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreateGroupNotifier extends StateNotifier<AsyncValue<void>> {
  CreateGroupNotifier(this._groupSaveService) : super(const AsyncData<void>(null));

  final GroupSaveService _groupSaveService;

  Future<void> create_group(Group group) async {
    state = AsyncValue.loading();
    state =
        await AsyncValue.guard(() => _groupSaveService.createGroupPlan(group));
  }
}

final createGroupNotifierProvider =
    StateNotifierProvider<CreateGroupNotifier, AsyncValue<void>>((ref) {
  return CreateGroupNotifier(ref.read(groupSavingsServiceProvider));
});
