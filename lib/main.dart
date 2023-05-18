import 'package:flutter/material.dart';
import 'package:hiv_tracker/screens/sign_up_page.dart';
import 'package:hiv_tracker/screens/start_page.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'ILIVE+',
      home: const Start(),
      debugShowCheckedModeBanner: false,
    );
  }
}
