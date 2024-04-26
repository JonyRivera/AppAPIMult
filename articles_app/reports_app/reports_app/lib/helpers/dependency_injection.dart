import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:reports_app/api/articles_api.dart';
import 'package:reports_app/helpers/base_http_dio.dart';

abstract class DependencyInjection {
  static void initialize() {
    Dio dio = Dio(
      BaseOptions(baseUrl: 'https://api.spaceflightnewsapi.net/'),
    );

    BaseHttpDio baseHttpDio = BaseHttpDio(dio);

    final ReportApi reportAPI = ReportApi(baseHttpDio);
    GetIt.instance.registerSingleton<ReportApi>(reportAPI);
  }
}
