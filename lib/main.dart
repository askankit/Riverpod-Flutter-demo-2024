import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_pod_demo/src/config/app_injector.dart';
import 'package:river_pod_demo/src/feature/home/presentation/views/state_notifier_view.dart';
import 'package:river_pod_demo/src/feature/home/presentation/views/main_home_view.dart';

import 'src/config/riverpod_logs.dart';
import 'src/core/routing/router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppInjector.init(
    appRunner: () =>
        runApp(ProviderScope(observers: [MyObserver()], child: MyApp())),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Riverpod flutter',
      builder: BotToastInit(),
      routerConfig: router,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: MainHomeView(),
    );
  }
}
