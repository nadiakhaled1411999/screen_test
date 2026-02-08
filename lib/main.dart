import 'package:flutter/material.dart';
import 'package:screen_test/core/theming/font_family.dart';
import 'package:screen_test/presentation/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
  theme: ThemeData(
    fontFamily: FontFamilies.ibmPlexSansArabic,
  ),
  
      home: const HomeScreen(),
    );
  }
}
