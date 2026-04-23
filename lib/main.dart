import 'dart:io';

import 'package:bohdan_bats_portfolio/firebase_options.dart';
import 'package:bohdan_bats_portfolio/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    // Required to use window_manager features
    await windowManager.ensureInitialized();

    // Set the default window size
    await windowManager.setSize(const Size(620, 600));
  }

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bohdan Bats',
      onGenerateRoute: (settings) => Routes.generateRoute(settings),
      initialRoute: "/",
    );
  }
}
