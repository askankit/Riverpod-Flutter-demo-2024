
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_pod_demo/src/feature/home/data/data_sources/data_sources_impl.dart';
import 'package:river_pod_demo/src/feature/home/data/data_sources/home_data_sources.dart';
import 'package:river_pod_demo/src/feature/home/data/repository/home_repo_impl.dart';
import 'package:river_pod_demo/src/feature/home/domain/respository/home_repository.dart';
import '../../domain/usecases/get_home_data.dart';
import 'home_states.dart';


final getHomeDataSource = Provider<HomeDataSource>((ref)=>HomeDataSourcesImpl());

final getHomeApiProvider = Provider<HomeRepository>((ref) {
  final dataSource = ref.watch(getHomeDataSource);
  return HomeRepoImpl(dataSource);
});

final getGetUser = Provider<GetUserHomeCase>((ref) {
  final dataSource = ref.watch(getHomeApiProvider);
  return GetUserHomeData(dataSource);
});


class HomeDataNotifier extends StateNotifier<HomeStates> {
  final GetUserHomeCase _getUserHomeCase;

  HomeDataNotifier(this._getUserHomeCase) : super(HomeInitialState());

  Future<void> fetchHomeData() async {
    try {
      state = HomeStatesLoading();
      final res = await _getUserHomeCase.call();
      state = res.fold((error) {
        print("Error: ${error.message}");
        return HomeErrorState(error: error.toString()); // Update state directly
      }, (trips) {
        return HomeStatesLoaded(trips); // Update state directly
      },
      );
      debugPrint("==================>>>>>Amit  $state");
    } catch (e, s) {
      state = HomeErrorState(error: e.toString()); // Update state directly
    }
    debugPrint("==================>>>>>Amit----------->>>>  $state");
  }
}

final homeDataNotifierProvider = StateNotifierProvider<HomeDataNotifier, HomeStates>((ref) {
    final getUserHomeCase = ref.watch(getGetUser);
    return HomeDataNotifier(getUserHomeCase);
  },
);



