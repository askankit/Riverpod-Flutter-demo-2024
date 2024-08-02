import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../http_service/api_providers.dart';


/// general getter

class Getters {
  Getters._();

  static GlobalKey<NavigatorState> get navKey => GetIt.I.get<GlobalKey<NavigatorState>>();

  static DateTime get now => DateTime.now();

 // static LocalStorage get getLocalStorage => GetIt.I.get<LocalStorage>();

  static ApiProvider get getHttpService => GetIt.I.get<ApiProvider>();

 //static AuthRepo get getAuthRepo => GetIt.I.get<AuthRepo>();

 //static SettingsRepo get getSettingsRepo => GetIt.I.get<SettingsRepo>();

 //static HomeRepo get homeRepo => GetIt.I.get<HomeRepo>();

 //static NetworkInfo get networkInfo => GetIt.I.get<NetworkInfo>();

 //static BuildContext? get getContext => navKey.currentContext;

 // static UserModel? get getLoginUser => GetIt.I.get<LocalStorage>().getLoginUser();

 // static String? get authToken => GetIt.I.get<LocalStorage>().getToken();

 // static int? get getUserId => GetIt.I.get<LocalStorage>().getLoginUser()?.id;

 // static bool get isLoggedIn => GetIt.I.get<LocalStorage>().getIsProfileComplete() == 1;
}
