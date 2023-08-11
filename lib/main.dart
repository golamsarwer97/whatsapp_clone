// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import './firebase_options.dart';
import './utils/colors.dart';
import './responsive/responsive_layout.dart';
import './screens/mobile_screen.dart';
import './screens/web_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WhatsApp UI Responsive',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor,
      ),
      debugShowCheckedModeBanner: false,
      home: ResponsiveLayout(
        webScreenLayout: WebScreen(),
        mobileScreenLayout: MobileScreen(),
      ),
    );
  }
}
