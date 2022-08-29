import 'package:esusu_savings/repositries/app_preference.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controller/app_notifier.dart';

final appRepositryProvider = Provider<AppRepositry>((ref) {
  return AppRepositry(ref.read);
});

final appProvider = ChangeNotifierProvider<AppNotifier>((ref) {
  return AppNotifier(ref);
});
