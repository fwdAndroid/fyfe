import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fyfe/routes/routes.dart';
import 'package:fyfe/screens/splash/splashscren.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Splash(),
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
