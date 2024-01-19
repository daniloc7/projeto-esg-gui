import 'package:flutter/material.dart';
import 'package:projeto/screens/projects_page.dart';
import 'package:projeto/screens/score_page.dart';
import 'package:projeto/utils/pallete.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Projeto ESG',
      theme: ThemeData(primaryColor: Colors.white38, primarySwatch: mycolor),
      // home: const TestPage(),
      routes: {
        '/': (context) => const ProjectsPage(),
        // '/': (context) => const ScorePage(),
        // '/': (context) => const ScorePage(),
        // '/indicator_form': (context) => IndicatorForm(),
      },
    );
  }
}
