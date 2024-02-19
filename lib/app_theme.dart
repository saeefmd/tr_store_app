import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tr_store_app/utils/app_colors.dart';

class AppTheme {

  static ThemeData lightTheme() => ThemeData(
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.backgroundColor,
    cardTheme: CardTheme(
      elevation: 2,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8)
      )
    ),
    appBarTheme: AppBarTheme(
        color: AppColors.backgroundColor,
        elevation: 0.0,
        centerTitle: false,
        titleTextStyle: GoogleFonts.lato(
          textStyle: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black
          ),
        )
    ),
    dividerTheme: DividerThemeData(
        color: Colors.grey.shade300,
        thickness: 0.5
    ),
    textTheme: GoogleFonts.latoTextTheme(
        const TextTheme(
          displayLarge: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.w600,
              color: Colors.black
          ),
          displayMedium: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w600,
              color: Colors.black
          ),
          displaySmall: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
              color: Colors.black
          ),
          headlineLarge: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
              color: Colors.black
          ),
          headlineMedium: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
              color: Colors.black
          ),
          headlineSmall: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w600,
              color: Colors.black
          ),
          titleLarge: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w400,
              color: Colors.black
          ),
          titleMedium: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.w400,
              color: Colors.black
          ),
          titleSmall: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w400,
              color: Colors.black
          ),
          bodyLarge: TextStyle(
              fontSize: 13.0,
              fontWeight: FontWeight.w400,
              color: Colors.black
          ),
          bodyMedium: TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.w400,
              color: Colors.black
          ),
          bodySmall: TextStyle(
              fontSize: 10.0,
              fontWeight: FontWeight.w400,
              color: Colors.black
          ),
        )
    ),
  );
}