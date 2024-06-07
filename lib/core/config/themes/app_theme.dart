import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../constants/app_colors.dart';

class AppTheme {
  static AppTheme? _instance;
  AppTheme._();
  factory AppTheme() => _instance ??= AppTheme._();

  static String _ClashGrotesk = 'ClashGrotesk';
  static String _Tajawal = "Tajawal";

  final lightTheme = ThemeData.light().copyWith(
    brightness: Brightness.light,
    useMaterial3: false,
    colorScheme: ColorScheme.fromSwatch(
        primarySwatch: AppColors.getMaterialColor(AppColors.primary)),
    scaffoldBackgroundColor: AppColors.white,
    primaryColor: AppColors.primary,
    textTheme: TextTheme(
      displayLarge: TextStyle(
        fontSize: 15.sp,
        color: AppColors.green,
        fontWeight: FontWeight.w600,
      ),
      displayMedium: TextStyle(fontSize: 12.5.sp, color: AppColors.black),
      displaySmall: TextStyle(fontSize: 12.5.sp, color: AppColors.green),
      titleLarge: TextStyle(
        fontFamily: _ClashGrotesk,
        fontSize: 30,
        color: AppColors.black,
      ),
      bodySmall: TextStyle(
        fontFamily: _Tajawal,
        fontSize: 15.7.sp,
        color: AppColors.black,
      ),
      labelSmall: TextStyle(
          fontFamily: _Tajawal,
          fontSize: 15.7.sp,
          fontWeight: FontWeight.w700,
          color: AppColors.primary,
          letterSpacing: 0),
      bodyLarge: TextStyle(
        fontSize: 11.sp,
        color: AppColors.black,
        fontWeight: FontWeight.w300,
      ),
      bodyMedium: TextStyle(fontSize: 11.5.sp, color: AppColors.white),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primary,
      elevation: 0,
      iconTheme: const IconThemeData(color: AppColors.black),
      toolbarTextStyle: TextStyle(
        color: AppColors.black,
        fontSize: 14.sp,
        fontWeight: FontWeight.bold,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      iconColor: AppColors.black,
      hintStyle: TextStyle(
        color: AppColors.greyColor,
        fontFamily: _Tajawal,
        fontSize: 15.7.sp,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(7),
        borderSide: BorderSide.none,
      ),
      suffixIconColor: AppColors.greyColor,
      prefixIconColor: AppColors.greyColor,
      filled: true,
      fillColor: AppColors.greyAccent,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(7),
        borderSide: const BorderSide(color: AppColors.greyAccent, width: 1),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(7),
        borderSide: const BorderSide(color: AppColors.red, width: 1.6),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(7),
        borderSide: const BorderSide(color: AppColors.red, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(7),
        borderSide: const BorderSide(color: AppColors.primary, width: 1.6),
      ),
      labelStyle: const TextStyle(color: AppColors.primary),
      errorStyle: TextStyle(
        fontFamily: _Tajawal,
        fontSize: 14.7.sp,
        color: AppColors.red,
        // locale: AppLocale().currentLanguage().locale
      ),
      counterStyle: const TextStyle(color: AppColors.black),
      isDense: true,
      helperStyle: const TextStyle(color: AppColors.black),
      suffixStyle: const TextStyle(color: AppColors.black),
      prefixStyle: const TextStyle(color: AppColors.black, fontSize: 20),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: AppColors.primary,
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: AppColors.white.withOpacity(0.8),
      contentTextStyle: const TextStyle(color: AppColors.white),
      actionTextColor: AppColors.white,
    ),
  );
  ///DarkThem////////////////////////////////////////////////////////////////////////////////////////
  final darkTheme = ThemeData.dark().copyWith(
    brightness: Brightness.dark,
    useMaterial3: true,
    primaryColor: AppColors.green,
    textTheme: TextTheme(
      displayLarge: TextStyle(
        fontSize: 15.sp,
        color: AppColors.white,
        fontWeight: FontWeight.w600,
      ),
      bodySmall: TextStyle(fontSize: 12.5.sp, color: AppColors.white),
      displayMedium: TextStyle(fontSize: 12.5.sp, color: AppColors.white),
      displaySmall: TextStyle(fontSize: 12.5.sp, color: AppColors.green),
      bodyLarge: TextStyle(fontSize: 11.sp, color: AppColors.white),
      bodyMedium: TextStyle(fontSize: 11.sp, color: AppColors.black),
    ),
    scaffoldBackgroundColor: AppColors.black,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.black,
      elevation: 0,
      iconTheme: const IconThemeData(color: Colors.white),
      toolbarTextStyle: TextStyle(
        color: AppColors.primary,
        fontSize: 14.sp,
        fontWeight: FontWeight.bold,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      iconColor: AppColors.black,
      hintStyle: const TextStyle(color: AppColors.black),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.grey),
      ),
      suffixIconColor: AppColors.green,
      prefixIconColor: AppColors.black,
      filled: true,
      fillColor: AppColors.grey,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.grey, width: 1),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.red, width: 1.6),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.red, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.green, width: 1.6),
      ),
      isDense: true,
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: AppColors.green,
    ),
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: AppColors.black,
      contentTextStyle: TextStyle(color: AppColors.white),
      actionTextColor: AppColors.green,
    ),
  );

  void changeTheme(BuildContext context) =>
      AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
          ? AdaptiveTheme.of(context).setDark()
          : AdaptiveTheme.of(context).setLight();

  bool isLight(BuildContext context) =>
      AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light;

  bool isDark(BuildContext context) =>
      AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark;
}
