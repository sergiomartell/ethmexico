import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sticky/utils/utils.dart';

ThemeData stickyTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.primary,
    textTheme: GoogleFonts.sairaTextTheme()
        .copyWith(headline5: const TextStyle(color: Colors.white)));

class AppStyles {
  static TextStyle menu = const TextStyle(
      color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16);
}
