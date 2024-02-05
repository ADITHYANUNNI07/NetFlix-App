import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/core/color/colors.dart';
import 'package:netflix/presentation/main%20page/screen_main_page.dart';

void main() {
  return runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Netflix',
      theme: ThemeData(
        iconTheme: const IconThemeData(color: Colors.white),
        scaffoldBackgroundColor: colorBlack,
        textTheme: GoogleFonts.poppinsTextTheme()
            .apply(bodyColor: Colors.white, displayColor: Colors.white),
      ),
      home: MainPageScreen(),
    );
  }
}