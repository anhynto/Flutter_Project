import 'package:dio/dio.dart';

class ApiManager {
  static final ApiManager _instance = ApiManager._internal();

  factory ApiManager() => _instance;

  Dio dio;

  ApiManager._internal() {
    dio = Dio();
    dio.options.baseUrl = "https://api.spacexdata.com/v4";
  }

  Future<Response<List<dynamic>>> getPastLaunches() async =>
      await dio.get<List<dynamic>>("/launches/past");

  Future<Response<List<dynamic>>> getCommingLaunches() async =>
      await dio.get<List<dynamic>>("/launches/upcoming");

  Future<Response<Map<String, dynamic>>> getNextLaunch() async =>
      await dio.get<Map<String, dynamic>>("/launches/next");

  Future<Response<Map<String, dynamic>>> getALaunch(String id) async =>
      await dio.get<Map<String, dynamic>>("/launches/" + id);
  //Future<Response<Map<String, dynamic>>> getSpot(int idSpot) async =>
  //    await dio.get<Map<String, dynamic>>("/spot-details/$idSpot.json");
}
