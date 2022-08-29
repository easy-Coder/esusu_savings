import 'package:esusu_savings/provider/app_provider.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppNotifier extends ChangeNotifier {
  final Ref _ref;

  AppNotifier(this._ref);
  void initialize() {
    _initialize = true;
    debugPrint("initialized");
    notifyListeners();
  }

  bool? _initialize;

  bool get onboarded => _ref.read(appRepositryProvider).getOnboarding();
  bool get appinit => _initialize ?? false;

  set onboarded(bool value) {
    _ref.read(appRepositryProvider).setOnboarding(value);
    notifyListeners();
  }
}
