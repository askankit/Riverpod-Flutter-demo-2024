
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/model/home_model.dart';
import 'home_notifier.dart';



final getNotedProvider = FutureProvider.autoDispose.family<HomeModel, int>((ref, id) async {
  final getUserHomeCase = ref.watch(getGetUser);
  final res = await getUserHomeCase.getNotes(id);
  return res.fold(
        (error) {
      print("Error: ${error.message}");
      throw Exception(error.toString());
    },
        (data) {
      return data;
    },
  );
});

