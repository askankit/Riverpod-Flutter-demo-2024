import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/model/home_model.dart';
import '../../domain/usecases/get_home_data.dart';
import 'home_notifier.dart';
import 'home_states.dart';

part 'async_notifier_provider_home.g.dart';

//final homeDataProvider = NotifierProvider<HomeDataNotifier, HomeStates>(()=>HomeDataNotifier());


@riverpod
class HomeUserDataNotifier extends _$HomeUserDataNotifier {
  late GetUserHomeCase _getUserHomeCase;
  List<HomeModel> trip =[];

  @override
  HomeStates? build()  {
    _getUserHomeCase = ref.watch(getGetUser);
    state =  HomeStatesLoading();
    return state;
  }


  Future<void> fetchHomeData() async {
    try {
      final res = await _getUserHomeCase.call();
      state = res.fold(
            (error) {
          print("Error: ${error.message}");
          return HomeErrorState(error: error.toString());
        },
            (trips) {
              trip.clear();
              trip.addAll(trips!);
          return HomeStatesLoaded(trips ?? []);
        },
      );
    } catch (e) {
      state = HomeErrorState(error: e.toString());
    }
  }
}

