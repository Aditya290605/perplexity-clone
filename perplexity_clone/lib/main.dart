import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:perplexity_clone/pages/home_page.dart';
import 'package:perplexity_clone/theme/app_color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Perplexity Clone',

      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.background,
        textTheme: GoogleFonts.interTextTheme(ThemeData.dark().textTheme)
            .copyWith(
              bodyMedium: TextStyle(fontSize: 16, color: AppColors.whiteColor),
            ),
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.submitButton),
      ),
      home: const HomePage(),
    );
  }
}
