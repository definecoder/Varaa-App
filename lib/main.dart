import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:vaara_app/firebase_classes/login_auth.dart';
import './screens/welcome_screen.dart';
import 'package:vaara_app/screens/welcome_screen.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Varaa App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginAuth(),
    );
  }
}
