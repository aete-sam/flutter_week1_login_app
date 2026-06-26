import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Developer's Hub",
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        scaffoldBackgroundColor: const Color(0xFFF8F9FD),
        colorScheme: const ColorScheme.light(
          primary: Color(0xFF8B5CF6),
          secondary: Color(0xFFD946EF),
          surface: Colors.white,
          onPrimary: Colors.white,
          onSecondary: Colors.white,
        ),
        textTheme: GoogleFonts.montserratTextTheme(ThemeData.light().textTheme),
      ),
      home: const Login(),
    );
  }
}
