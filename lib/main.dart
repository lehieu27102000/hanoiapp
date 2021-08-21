import 'package:flutter/material.dart';
import 'package:hanoiapp/app/landing_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hanoiapp/services/auth.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'App của hiếu',
      theme: ThemeData (
        primaryColor: Colors.deepPurple
      ),
      home: LandingPage(
        auth: Auth(),
      ),
    );
  }
}