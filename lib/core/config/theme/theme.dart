import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rick_and_morty/core/config/theme/app_colors.dart';
import 'package:rick_and_morty/core/config/theme/size.dart';

/// This class sets the app's theme data and colors.
class AppTheme {
  /// Returns the app's theme data.
  static ThemeData get appTheme => ThemeData(
        scaffoldBackgroundColor: AppColor.backgroundColor,
        brightness: Brightness.light,
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          backgroundColor: AppColor.backgroundColor,
          elevation: 0,
          titleTextStyle: TextStyle(
            fontFamily: GoogleFonts.inter().fontFamily,
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          centerTitle: true,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.dark,
            statusBarColor: Colors.transparent,
            systemNavigationBarColor: Colors.white,
            systemNavigationBarIconBrightness: Brightness.dark,
          ),
        ),
        fontFamily: GoogleFonts.inter().fontFamily,
        cupertinoOverrideTheme: CupertinoThemeData(
          primaryColor: AppColor.primaryColor,
          barBackgroundColor: AppColor.backgroundColor,
        ),
        scrollbarTheme: ScrollbarThemeData(
          radius: Radius.circular(designRadius),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          elevation: 0,
          backgroundColor: AppColor.backgroundColor,
          selectedIconTheme: IconThemeData(color: AppColor.primaryColor),
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: AppColor.primaryColor,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(designRadius8),
            ),
            padding: const EdgeInsets.all(8),
            elevation: 0,
            textStyle:
                const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            foregroundColor: AppColor.backgroundColor,
            backgroundColor: AppColor.primaryColor,
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            side: BorderSide(color: AppColor.primaryColor),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(designRadius8),
            ),
            padding: const EdgeInsets.all(8),
            textStyle:
                const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            foregroundColor: AppColor.primaryColor,
          ),
        ),
        colorScheme: ColorScheme(
          primary: AppColor.primaryColor,
          secondary: AppColor.primaryColor,
          surface: AppColor.surfaceColor,
          error: AppColor.errorColor,
          onPrimary: Colors.white,
          onSecondary: Colors.black,
          onSurface: Colors.black,
          onError: Colors.white,
          brightness: Brightness.light,
        ),
        textTheme: GoogleFonts.interTextTheme(),
      );
}
