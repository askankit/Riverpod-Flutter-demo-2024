import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:river_pod_demo/src/core/routing/routes.dart';

import '../../feature/home/presentation/views/async_notifier_provider_view.dart';
import '../../feature/home/presentation/views/change_notifier_provider_view.dart';
import '../../feature/home/presentation/views/future_provider_view.dart';
import '../../feature/home/presentation/views/main_home_view.dart';
import '../../feature/home/presentation/views/provider_view.dart';
import '../../feature/home/presentation/views/state_notifier_view.dart';
import '../../feature/home/presentation/views/state_provider_view.dart';
import '../../feature/home/presentation/views/stream_provider_view.dart';


// Provider to get the router instance
final routerProvider = Provider<GoRouter>((ref) {
  final authStateNotifier = ValueNotifier(const AsyncValue.loading());
  ref.onDispose(authStateNotifier.dispose);
/*  ref.listen(currentAuthStateProvider, (_, value) {
    authStateNotifier.value = value;
  });*/

  final router = GoRouter(
    debugLogDiagnostics: true,
    observers:  [BotToastNavigatorObserver()],
    initialLocation: Routes.mainPage,
    routes: [
      GoRoute(
        path: Routes.mainPage,
        builder: (_, __) => const MainHomeView(),
      ),GoRoute(
        path: Routes.provider,
        builder: (_, __) => const ProviderView(),
      ),
      GoRoute(
        path: Routes.stateNotifierProvider,
        builder: (_, __) => const StateNotifierView(),
      ),
      GoRoute(
        path: Routes.futureProvider,
        builder: (_, __) => const FutureProviderView(),
      ),
      GoRoute(
        path: Routes.streamProvider,
        builder: (_, __) => const StreamProviderView(),
      ),
      GoRoute(
        path: Routes.asyncProvider,
        builder: (_, __) => const AsyncNotifierProviderView(),
      ),
      GoRoute(
        path: Routes.changeProvider,
        builder: (_, __) => const ChangeNotifierProviderView(),
      ),
      GoRoute(
        path: Routes.stateProvider,
        builder: (_, __) => const StateProviderView(),
      ),
    ],
    refreshListenable: authStateNotifier,
    redirect: (_, state) {
  //    final authState = ref.read(currentAuthStateProvider);
   //   if (!authState.allowedPaths.contains(state.fullPath)) {
 //       return authState.redirectPath;
  //    }
      return null;
    },
  );
  ref.onDispose(router.dispose);
  return router;
});
