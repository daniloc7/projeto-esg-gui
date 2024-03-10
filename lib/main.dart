import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:projeto/firebase_options.dart';
import 'package:projeto/providers/factor_provider.dart';
import 'package:projeto/providers/indicator_provider.dart';
import 'package:projeto/providers/project_provider.dart';
import 'package:projeto/providers/score_provider.dart';
import 'package:projeto/screens/factor_item/factor_form.dart';
import 'package:projeto/screens/project_page/projects_page.dart';
import 'package:projeto/utils/pallete.dart';
import 'package:provider/provider.dart';

import 'screens/login_page.dart';
import 'screens/score_page/score_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseFirestore.instance.settings = const Settings(
    persistenceEnabled: true,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Provedor de autenticação
        ChangeNotifierProvider<ProjectProvider>(
          create: (_) => ProjectProvider(),
        ),
        ChangeNotifierProvider<ScoreProvider>(
          create: (_) => ScoreProvider(),
        ),
        ChangeNotifierProvider<FactorProvider>(
          create: (_) => FactorProvider(),
        ),
        ChangeNotifierProvider<IndicatorProvider>(
          create: (_) => IndicatorProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Projeto ESG',

        // home: LoginPage(),
        theme: ThemeData(primaryColor: Colors.white38, primarySwatch: mycolor),
        routes: {
          // '/': (context) => FactorForm(fkIdScore: 'sG9Nl4Fyz15SebVpWyCb'),
          '/': (context) => const LoginPage(),
          '/projects_page': (context) => const ProjectsPage(),
          '/score_page': (context) => const ScorePage(),
        },
      ),
    );
  }
}
