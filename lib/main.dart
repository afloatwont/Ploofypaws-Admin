import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ploofypaws_doctor/firebase_options.dart';
import 'package:ploofypaws_doctor/pages/appointment_page.dart';
import 'package:ploofypaws_doctor/pages/availability_page.dart';
import 'package:ploofypaws_doctor/pages/login_page.dart';
import 'package:ploofypaws_doctor/pages/patient_list.dart';
import 'package:ploofypaws_doctor/pages/root.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ploofypaws Admin',
      theme: ThemeData.dark(
        useMaterial3: true,
      ),
      home: const Root(),
    );
  }
}
