import 'package:dartz/dartz.dart';

import '../../../../core/http_service/api_providers.dart';
import '../../../../core/http_service/data_response.dart';
import '../../../../core/utils/all_getter.dart';
import 'home_data_sources.dart';
import '../model/home_model.dart';

class HomeDataSourcesImpl extends HomeDataSource {
  @override
  Future<ResponseWrapper<List<HomeModel>>> getHomeData({required Map<String,dynamic> body})async {
    try {
      final dataResponse = await Getters.getHttpService.request<List<HomeModel>>(
        body: body,
        requestType: RequestType.get,
        url: "https://jsonplaceholder.typicode.com/todos",
        fromJson: (json) => List<HomeModel>.from((json as List).map((data)=>HomeModel.fromJson(data)))
      );
      if (dataResponse.status == true && dataResponse.data != null) {
        return ResponseWrapper(data:dataResponse.data);
      } else {
        return ResponseWrapper();
      }
    } catch (e) {
      rethrow;
    }

  }


  @override
  Future<ResponseWrapper<HomeModel>> getTodoById({required int id})async {
    try {
      final dataResponse = await Getters.getHttpService.request<HomeModel>(
        requestType: RequestType.get,
        url: "https://jsonplaceholder.typicode.com/todos/$id",
        fromJson: (json) => HomeModel.fromJson(json)
      );
      if (dataResponse.status == true && dataResponse.data != null) {
        return ResponseWrapper(data:dataResponse.data);
      } else {
        return ResponseWrapper();
      }
    } catch (e) {
      rethrow;
    }

  }

}