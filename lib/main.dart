import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:projeto/firebase_options.dart';
import 'package:projeto/providers/project_provider.dart';
import 'package:projeto/screens/project_page/projects_page.dart';
import 'package:projeto/utils/pallete.dart';
import 'package:provider/provider.dart';

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
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Projeto ESG',

        // home: LoginPage(),
        theme: ThemeData(primaryColor: Colors.white38, primarySwatch: mycolor),
        routes: {
          '/': (context) => const ProjectsPage(),
        },
        // home: CadastrarMaterial(),
      ),
    );
  }
}

//     return MaterialApp(
//       title: 'Projeto ESG',
//       theme: ThemeData(primaryColor: Colors.white38, primarySwatch: mycolor),
//       // home: const TestPage(),
//       routes: {
//         '/': (context) => const ProjectsPage(),
//         // '/user':(context)=> const
//         // '/': (context) => const ScorePage(),
//         // '/': (context) => const ScorePage(),
//         // '/indicator_form': (context) => IndicatorForm(),
//       },
//     );
//   }
// }
