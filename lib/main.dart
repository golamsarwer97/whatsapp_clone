// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'utils/colors.dart';
import './responsive/responsive_layout.dart';
import './screens/mobile_screen.dart';
import './screens/web_screen.dart';

void main() {
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
