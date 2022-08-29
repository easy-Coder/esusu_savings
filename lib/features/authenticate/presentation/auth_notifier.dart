import 'package:esusu_savings/features/authenticate/repositries/auth_repositry.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// TODO: create a state

class AuthNotifier extends StateNotifier<AsyncValue<void>> {
  AuthNotifier(this._authRepositry) : super(const AsyncData<void>(null));

  final AuthRepositry _authRepositry;

  Future<void> signUserIn(String email, String password) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
        () async => await _authRepositry.signIn(email, password));
  }

  Future<void> createUser(String email, String password) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
        () async => await _authRepositry.createUser(email, password));
  }
}

final authNotifierProvider =
    StateNotifierProvider<AuthNotifier, AsyncValue<void>>((ref) {
  return AuthNotifier(ref.read(authRepositryProvider));
});


