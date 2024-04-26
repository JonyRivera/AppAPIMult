import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:reports_app/api/articles_api.dart';
import 'package:reports_app/helpers/http_response.dart';
import 'package:reports_app/models/articles.dart';
import 'package:reports_app/models/articles_response.dart';
import 'package:reports_app/screens/articles_detail_screen.dart';
import 'package:reports_app/widget/articles_widget.dart';

class ReportsScreen extends StatefulWidget {
  const ReportsScreen({super.key});

  @override
  State<ReportsScreen> createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen> {
  //Agregar la inyección de dependencias con GetIt
  final ReportApi reportApi = GetIt.instance<ReportApi>();

  //Crear la función llamada loadReports() para la consulta de los datos
  Future<List<Report>> loadReports() async {
    HttpResponse<ReportsResponse> response = await reportApi.getAllReports();
    return response.data!.reports;
  }

  void showDetail(int id) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return ReportDetailScreen(reportID: id);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: const Text("Report API"),
        title: const Center(
          child: Text(
            "ARTICLES API",
            textAlign:
                TextAlign.center, // Centrar el texto dentro del Text widget
            style: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontWeight: FontWeight.bold, // Establecer el estilo en negrita
            ),
          ),
        ),
        foregroundColor: Color.fromARGB(255, 255, 255, 255),
        backgroundColor: Color.fromARGB(255, 102, 102, 102),
      ),
      backgroundColor: Color.fromARGB(255, 155, 133, 255),
      body: FutureBuilder<List<Report>>(
        future: loadReports(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                List<Report>? reportList = snapshot.data;
                return ReportWidget(
                  report: reportList![index],
                  onTap: showDetail,
                );
              });
        },
      ),
    );
  }
}
