import 'package:flutter/material.dart';
import 'pages/splashPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Leafboard',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF5B6BF5)),
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: const Color(0xFFF5F5FA),
      ),
      home: const SplashPage(),
    );
  }
}
