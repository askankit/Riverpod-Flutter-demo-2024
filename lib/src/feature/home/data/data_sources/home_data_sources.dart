import '../../../../core/http_service/data_response.dart';
import '../model/home_model.dart';

abstract class HomeDataSource {
  Future<ResponseWrapper<List<HomeModel>>?> getHomeData({required Map<String,dynamic> body});

  Future<ResponseWrapper<HomeModel>?> getTodoById({required int id});
}

