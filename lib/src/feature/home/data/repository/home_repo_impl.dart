
import 'package:river_pod_demo/src/feature/home/data/model/home_model.dart';
import '../../../../core/http_service/data_response.dart';
import '../../domain/respository/home_repository.dart';
import '../data_sources/home_data_sources.dart';

class HomeRepoImpl extends HomeRepository{
  final HomeDataSource dataSource;
  HomeRepoImpl(this.dataSource);

  @override
  Future<ResponseWrapper<List<HomeModel>>?> getHomeData() async {
    try {
      final res = await dataSource.getHomeData(body: {});
      if(res != null) {
        return res;
      }
     } catch (error) {
     print("$error");
    return ResponseWrapper(data: [],message: error.toString());
    }
    return null;
  }

  @override
  Future<ResponseWrapper<HomeModel>?> getNote(int id) async {
    try {
      final res = await dataSource.getTodoById(id: id);
      return res;
     } catch (error) {
     print("$error");
    return ResponseWrapper(data: null,message: error.toString());
    }
  }

}