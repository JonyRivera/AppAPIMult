import 'package:reports_app/helpers/base_http_dio.dart';
import 'package:reports_app/helpers/http_response.dart';
import 'package:reports_app/models/articles.dart';
import 'package:reports_app/models/articles_response.dart';

class ReportApi {
  final BaseHttpDio baseHttpDio;

  ReportApi(this.baseHttpDio);

  Future<HttpResponse<ReportsResponse>> getAllReports() async {
    return baseHttpDio.resquest('/v4/articles/', method: 'GET', parser: (data) {
      return ReportsResponse.fromJson(data['results']);
    });
  }

  Future<HttpResponse<Report>> getSingleReport(int id) async {
    return baseHttpDio.resquest('/v4/articles/$id', method: 'GET',
        parser: (data) {
      return Report.fromJson(data);
    });
  }
}
