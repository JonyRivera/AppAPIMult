import 'package:flutter/material.dart';
import 'package:reports_app/models/articles.dart';

class ReportWidget extends StatelessWidget {
  final Report report;
  final Function onTap;
  const ReportWidget({
    super.key,
    required this.report,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap(report.id);
      },
      child: Container(
        margin: const EdgeInsets.fromLTRB(12, 12, 12, 0),
        padding: const EdgeInsets.all(8.0),
        decoration: const BoxDecoration(
            color: Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Column(
          children: [
            Text(
              report.title,
              style: const TextStyle(
                color: Color.fromARGB(255, 13, 15, 13),
                fontWeight:
                    FontWeight.bold, // Aquí se establece el estilo en negrita
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Image.network(
                report.image_url,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(report.summary),
            ),
          ],
        ),
      ),
    );
  }
}
