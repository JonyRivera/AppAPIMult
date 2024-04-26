import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:reports_app/api/articles_api.dart';
import 'package:reports_app/helpers/http_response.dart';
import 'package:reports_app/models/articles.dart';

class ReportDetailScreen extends StatelessWidget {
  final int reportID;
  const ReportDetailScreen({super.key, required this.reportID});

  Future<Report> loadSingleReport() async {
    HttpResponse<Report> response =
        await GetIt.instance<ReportApi>().getSingleReport(reportID);
    return response.data!;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Report>(
        future: loadSingleReport(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          return Scaffold(
            appBar: AppBar(
              title: const Text("Articles Api"),
              foregroundColor: Color.fromARGB(255, 255, 247, 0),
              backgroundColor: Color.fromARGB(255, 75, 0, 72),
            ),
            body: Padding(
              padding: const EdgeInsets.all(11.0),
              child: Column(
                children: [
                  Text(
                    snapshot.data!.title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      //fontFamily:,
                      color: Color.fromARGB(255, 64, 0, 51),
                    ),
                  ),
                  Text(snapshot.data!.news_site.toString()),
                  Padding(
                    padding: const EdgeInsets.all(11.0),
                    child: Image.network(
                      snapshot.data!.image_url,
                      width: 180,
                      height: 180,
                    ),
                  ),
                  Text(snapshot.data!.summary),
                  Text(snapshot.data!.url),
                ],
              ),
            ),
          );
        });
  }
}
