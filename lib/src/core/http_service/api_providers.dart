import 'package:dio/dio.dart';
import '../utils/helpers.dart';
import 'Injector.dart';
import 'data_response.dart';



enum RequestType {
  post,
  get,
  delete,
  put,
  multipart,
}

class ApiProvider    {
  late Dio _dio;

  ApiProvider() {
    _dio = Injector().getDio();
  }

  ///  ---------------------------------Create a Network Request ---------------------------------------->

  Future<ResponseWrapper> request<T>({
    required String url,
    RequestType requestType = RequestType.post,
    Map<String, dynamic>? body,
    String? imagePath,
    String? paramName,
    bool useFormData =false,
    required T Function(dynamic json) fromJson,
  }) async {
    try {
      Map<String, dynamic> map = body ?? {};
      Response response = await _checkRequest(
        fullUrl: url,
        imagePath: imagePath,
        paramName: paramName,
        requestType: requestType,
        body: map,
         useFormData:useFormData,
      );
      var parsedData = response.data != null
          ? _dataParser<T>(response.data, fromJson)
          : null;
      var dataResponse = ResponseWrapper<T>(
        statusCode: response.statusCode,
        message: response.statusMessage,
        status:response.statusCode==200,
        data: parsedData,
      );
      return dataResponse;
    } catch (err ,c) {
      functionLog(msg: "t>>>>>>>>$err", fun: "requestData");
      functionLog(msg: "t>>>>>>>>$c", fun: "requestData");
      if (err is DioException) {
        if (err.type == DioExceptionType.receiveTimeout ||
            err.type == DioExceptionType.connectionTimeout) {
          return ResponseWrapper(statusCode: 0, message: "Unable to reach the servers",status: false);
        } else if (err.type == DioExceptionType.connectionError) {
          return ResponseWrapper(statusCode: 0, message: "Please check your internet connection",status: false);
        } else if (err.response != null && (err.response?.statusCode == 401)) {
          throw ResponseWrapper(statusCode: 0, message: "Authentication Failed",status: false);
        }
      }
      final res = (err as dynamic).response;
      if (res != null && res?.data.runtimeType != String) {
        return ResponseWrapper.fromJson(
          res?.data,
          (data) => null,
        );
      }
      return ResponseWrapper(statusCode: 0, message: err.toString(),status: false);
    }
  }


  ///  ---------------------------------Get request Type ---------------------------------------->
  Future<Response> _checkRequest({
    required String fullUrl,
    required RequestType requestType,
    required String? imagePath,
    required String? paramName,
     bool useFormData=false,
    required Map<String, dynamic> body,
  }) async {
    final headerToken = Injector.getHeaderToken();
    if (requestType == RequestType.get) {
      return _dio.get(
        fullUrl,
        options: headerToken,
        queryParameters: body,
      );
    } else if (requestType == RequestType.post) {
      return _dio.post(
        fullUrl,
        data: useFormData? FormData.fromMap(body):body,
        options: headerToken,
      );
    }
    else if (requestType == RequestType.delete) {
      return _dio.delete(
        fullUrl,
        data: body,
        options: headerToken,
      );
    } else if (requestType == RequestType.put) {
      return _dio.put(
        fullUrl,
        data: body,
        options: headerToken,
      );
    } else {
      return _dio.patch(
        fullUrl,
        data: body,
        options: headerToken,
      );
    }
  }



 /*String? _getFileType(String path) {
    final mimeType = lookupMimeType(path);
    String? result = mimeType?.substring(0, mimeType.indexOf('/'));
    return result;
  }*/

  T _dataParser<T>(dynamic json, T Function(dynamic) fromJson) {
    return fromJson(json);
  }
}


