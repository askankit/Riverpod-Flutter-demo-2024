import 'dart:async';
import 'package:get_it/get_it.dart';
import '../core/http_service/Injector.dart';
import '../core/http_service/api_providers.dart';

typedef AppRunner = FutureOr<void> Function();

class AppInjector {
  static Future<void> init({
    required AppRunner appRunner,
  }) async {
    await _initDependencies();
    appRunner();
  }

  static Future<void> _initDependencies() async {
    await GetIt.I.allReady();
    GetIt.I.registerLazySingleton<Injector>(() => Injector());
    GetIt.I.registerLazySingleton<ApiProvider>(() => ApiProvider());
  }
}
