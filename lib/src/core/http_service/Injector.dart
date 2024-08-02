import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import '../utils/helpers.dart';
import 'api_constants.dart';

class Injector {
  static final Injector _singleton = Injector._internal();
  static final _dio = Dio();

  factory Injector() {
    return _singleton;
  }

  Injector._internal();

  Dio getDio() {
    BaseOptions options = BaseOptions(
        receiveTimeout: const Duration(seconds: 90),
        connectTimeout: const Duration(seconds: 90));
    _dio.options = options;
    _dio.options.followRedirects = false;
    _dio.options.headers["Content-Type"] = "application/json";
    /*  (_dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
      final client = HttpClient(
        context: SecurityContext(withTrustedRoots: false),
      );
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };*/
    _dio.interceptors.clear();
    _dio.interceptors.add(LoggingInterceptors());
    return _dio;
  }

  static Options? getHeaderToken() {
 /*   String? token = Getters.authToken;
    int? userId = Getters.getUserId;
    if (token != null) {
      printLog("Logged in user Id==>>$userId");
      var headerOptions = Options(headers: {
        'Authorization': 'Bearer $token',
        // options.headers['Authorization'] = 'Bearer ' +usertoken!;
      });
      return headerOptions;
    }*/
    var headerOptions = Options(headers: {
      'Authorization': 'Bearer ',
      // options.headers['Authorization'] = 'Bearer ' +usertoken!;
    });
    return headerOptions;
    return null;
  }
}

String hitUrl = "";

bool shouldRetryOnHttpException(DioException dioException) {
  String message = dioException.message ?? "";
  return dioException.type == DioExceptionType.unknown &&
      (dioException.error is HttpException &&
          message
              .contains('Connection closed before full header was received'));
}


class LoggingInterceptors extends Interceptor {
  String printObject(Object object) {
    // Encode your object and then decode your object to Map variable
    Map jsonMapped = json.decode(json.encode(object));

    // Using JsonEncoder for spacing
    JsonEncoder encoder = const JsonEncoder.withIndent('  ');

    // encode it to string
    String prettyPrint = encoder.convert(jsonMapped);
    return prettyPrint;
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    hitUrl = options.path;
    // "${options.method.toUpperCase()} ${"" + (options.baseUrl) + (options.path)}";
    printLog(" API URL ✈️✈️✈️✈ ️--> $hitUrl");
    options.headers.forEach((k, v) => printLog('$k: $v'));
    printLog("queryParameters:");
    options.queryParameters.forEach((k, v) => printLog('$k: $v'));
    if (options.data != null) {
      try {
        // print("Body: ${printObject(options.data)}");
        FormData formData = options.data as FormData;
        printLog("Body:");
        var buffer = [];
        for (MapEntry<String, String> pair in formData.fields) {
          buffer.add('${pair.key}:${pair.value}');
        }
        printLog("Body 💪💪💪💪💪💪 =====:{${buffer.join(', ')}}");
      } catch (e) {
        printLog("Body 💪💪💪💪💪💪 ====: ${printObject(options.data)}");
      }
    }
    return super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    blocLog(
        msg: "<-- ${err.message} ${(err.response?.requestOptions != null ? (err.response!.requestOptions.baseUrl + err.response!.requestOptions.path) : 'URL')}",
        bloc: 'DioException');
    blocLog(
        msg: "${err.response != null ? err.response!.data : 'Unknown Error'}",
        bloc: 'DioException');
    return super.onError(err, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    printLog("Response for $hitUrl👉👉👉👉👉: ${response.data}");
    printLog("<----- END 👍👍👍👍👍👍 HTTP ----->");
    return super.onResponse(response, handler);
  }
}
