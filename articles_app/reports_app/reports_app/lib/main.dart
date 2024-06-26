import 'package:flutter/material.dart';
import 'package:reports_app/helpers/dependency_injection.dart';
import 'package:reports_app/screens/articles_screen.dart';

void main() {
  //Iniciar la inyección de dependencias
  DependencyInjection.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Articles Api',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ReportsScreen(),
    );
  }
}
