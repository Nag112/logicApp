import 'package:dio/dio.dart';
class HttpService {
  static BaseOptions options = new BaseOptions(
    baseUrl: "https://jsonplaceholder.typicode.com",
    responseType: ResponseType.json,
    connectTimeout: 6000,
    receiveTimeout: 8000,
  );
  Dio dio = new Dio(options);
}
