import 'dart:convert';

import 'articles.dart';

ReportsResponse reportsResponseFromJson(String str) =>
    ReportsResponse.fromJson(json.decode(str));

String eventsResponseToJson(ReportsResponse data) => json.encode(data.toJson());

class ReportsResponse {
  ReportsResponse({
    required this.reports,
  });

  final List<Report> reports;

  factory ReportsResponse.fromJson(List<dynamic> json) {
    List<Report> reports =
        json.map((reportJson) => Report.fromJson(reportJson)).toList();
    return ReportsResponse(reports: reports);
  }

  Map<String, dynamic> toJson() => {
        "articles": List<dynamic>.from(reports.map((x) => x.toJson())),
      };
}
