import 'package:esusu_savings/features/account/presentation/create_profile/create_profile_page.dart';
import 'package:esusu_savings/features/account/repositry/account_repositry.dart';
import 'package:esusu_savings/features/account/service/profile_services.dart';
import 'package:esusu_savings/features/authenticate/presentation/login_page.dart';
import 'package:esusu_savings/features/authenticate/presentation/signup_page.dart';
import 'package:esusu_savings/features/authenticate/repositries/auth_repositry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:esusu_savings/provider/app_provider.dart';

import '../pages/home_page/home_page.dart';
import '../pages/onboarding_screen.dart';
import '../pages/startup.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final router = RouterNotifier(ref);

  return GoRouter(
    routes: router._routes,
    refreshListenable: router,
    redirect: router._redirectLogic,
    debugLogDiagnostics: true,
    initialLocation: '/',
  );
});

class RouterNotifier extends ChangeNotifier {
  final Ref _ref;

  RouterNotifier(this._ref) {
    _ref.listen(authStateProvider, (previous, next) => notifyListeners());
    _ref.listen(appProvider, (previous, next) => notifyListeners());
    _ref.listen(userProfileProvider, (previous, next) => notifyListeners());
  }

  String? _redirectLogic(GoRouterState state) {
    final user = _ref.read(authRepositryProvider).user;
    final initialized = _ref.read(appProvider).appinit;
    final onboarded = _ref.read(appProvider).onboarded;
    final user_profile = _ref.watch(userProfileProvider).whenOrNull(
          data: (data) => data,
        );

    final loggingIn = state.location == '/login';
    final signingUp = state.location == '/signup';
    final onboarding = state.location == '/onboarding';
    final splash = state.location == '/splash';
    final creating_profile = state.location == '/create_profile';

    if (!initialized) {
      return splash ? null : '/splash';
    }

    if (!onboarded) {
      return onboarding ? null : '/onboarding';
    }

    if (user == null) {
      if (signingUp) {
        return null;
      }
      return loggingIn ? null : '/login';
    }

    if (user_profile == null) {
      return creating_profile ? null : '/create_profile';
    }

    if (loggingIn) return '/';
    if (signingUp) return '/';
    if (splash) return '/';
    if (creating_profile) return '/';
    return null;
  }

  List<GoRoute> get _routes => [
        GoRoute(
          path: "/onboarding",
          builder: (context, state) => const OnboardingScreen(),
        ),
        GoRoute(
          path: "/splash",
          builder: (context, state) => const SplashScreen(),
        ),
        GoRoute(
          path: "/login",
          builder: (context, state) => const LoginScreen(),
        ),
        GoRoute(
          path: "/signup",
          builder: (context, state) => const SignUpScreen(),
        ),
        GoRoute(
          path: "/create_profile",
          builder: (context, state) => const CreateProfilePage(),
        ),
        GoRoute(
          path: "/",
          builder: (context, state) => HomeScreen(),
        ),
      ];
}
