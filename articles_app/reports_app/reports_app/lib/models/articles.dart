import 'dart:convert';

List<Report> reportFromJson(String str) =>
    List<Report>.from(json.decode(str).map((x) => Report.fromJson(x)));

String reportToJson(List<Report> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Report {
  int id;
  String title;
  String url;
  String summary;
  String news_site;
  String image_url;

  Report({
    required this.id,
    required this.title,
    required this.url,
    required this.summary,
    required this.news_site,
    required this.image_url,
  });

  factory Report.fromJson(Map<String, dynamic> json) => Report(
        id: json["id"],
        title: json["title"],
        url: json["url"],
        summary: json["summary"],
        news_site: json["news_site"],
        image_url: json["image_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "url": url,
        "summary": summary,
        "news_site": news_site,
        "image_url": image_url,
      };
}
