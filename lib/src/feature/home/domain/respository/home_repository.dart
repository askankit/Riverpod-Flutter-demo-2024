
import 'package:river_pod_demo/src/feature/home/data/model/home_model.dart';
import '../../../../core/http_service/data_response.dart';

abstract class HomeRepository {
  Future<ResponseWrapper<List<HomeModel>>?> getHomeData();
  Future<ResponseWrapper<HomeModel>?> getNote(int id);
}
