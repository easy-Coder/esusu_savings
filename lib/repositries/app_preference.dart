import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final prefProvider = FutureProvider<SharedPreferences>((ref) async {
  return SharedPreferences.getInstance();
});

class AppRepositry {
  final Reader _reader;
  SharedPreferences? pref;

  AppRepositry(this._reader) {
    _init();
  }

  _init() async {
    pref = await _reader(prefProvider.future);
  }

  bool getOnboarding() {
    return pref?.getBool("Onboarded") ?? false;
  }

  void setOnboarding(bool value) async {
    await pref?.setBool("Onboarded", value);
  }
}
