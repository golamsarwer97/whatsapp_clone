// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import './features/landing/screen/landing_screen.dart';
import './router.dart';

import './firebase_options.dart';
import './responsive/responsive_layout.dart';
import './screens/mobile_screen.dart';
import './screens/web_screen.dart';
import './common/widgets/error.dart';
import './common/widgets/loader.dart';
import './features/auth/controller/auth_controller.dart';
import './common/utils/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'WhatsApp UI Responsive',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor,
        appBarTheme: const AppBarTheme(
          color: appBarColor,
        ),
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) => generateRoute(settings),
      home: ref.watch(userDataAuthProvider).when(
            data: (user) {
              if (user == null) {
                return const LandingScreen();
              }
              return const MobileScreen();
            },
            error: (err, trace) {
              return ErrorScreen(
                error: err.toString(),
              );
            },
            loading: () => const Loader(),
          ),
      /*home: ResponsiveLayout(
        webScreenLayout: WebScreen(),
        mobileScreenLayout: MobileScreen(),
      ),*/
    );
  }
}
