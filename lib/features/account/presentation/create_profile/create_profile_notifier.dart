import 'package:esusu_savings/features/account/domain/user.dart';
import 'package:esusu_savings/features/account/service/profile_services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreateProfileNotifier extends StateNotifier<AsyncValue<void>> {
  CreateProfileNotifier(this._profileService)
      : super(const AsyncData<void>(null));

  final ProfileService _profileService;

  Future<void> createProfile(AppUser user) async {
    state = const AsyncValue.loading();
    state =
        await AsyncValue.guard(() => _profileService.createUserProfile(user));
  }
}

final createProfileProvider =
    StateNotifierProvider<CreateProfileNotifier, AsyncValue<void>>((ref) {
  return CreateProfileNotifier(ref.read(profileServiceProvider));
});
