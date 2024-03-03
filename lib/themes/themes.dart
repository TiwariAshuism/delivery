import 'package:flutter/material.dart';

import 'colors.dart';

final border = OutlineInputBorder(
    borderSide: const BorderSide(
      width: 0,
      style: BorderStyle.none,
    ),
    borderRadius: BorderRadius.circular(8));

final lightTheme = ThemeData(
  fontFamily: 'Poppins',
  scaffoldBackgroundColor: Colors.grey.shade50,
  splashColor: colorPrimaryLight.withOpacity(0.1),
  highlightColor: colorPrimaryLight.withOpacity(0.05),
  iconTheme: const IconThemeData(color: colorPrimaryLight),
  listTileTheme: const ListTileThemeData(iconColor: colorPrimaryLight),
  tabBarTheme: const TabBarTheme(
      labelColor: Colors.black, unselectedLabelColor: Colors.grey),
  appBarTheme: const AppBarTheme(
      elevation: 1,
      color: Colors.white,
      toolbarTextStyle: TextStyle(color: colorSecondaryLight),
      titleTextStyle: TextStyle(color: Colors.grey, fontSize: 18),
      iconTheme: IconThemeData(color: colorPrimaryLight)),
  inputDecorationTheme: InputDecorationTheme(
      border: border,
      errorBorder: border,
      focusedBorder: border,
      focusedErrorBorder: border,
      disabledBorder: border,
      enabledBorder: border,
      filled: true,
      fillColor: Colors.grey.shade200),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedIconTheme: const IconThemeData(color: colorPrimaryLight),
      unselectedIconTheme:
          IconThemeData(color: colorPrimaryLight.withOpacity(0.5)),
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedLabelStyle: const TextStyle(color: Colors.grey),
      unselectedLabelStyle: const TextStyle(color: Colors.grey),
      type: BottomNavigationBarType.fixed),
  colorScheme: ColorScheme(
    brightness: Brightness.light,
    primary: colorPrimaryLight,
    onPrimary: Colors.white,
    secondary: colorSecondaryLight,
    onSecondary: Colors.white,
    background: Colors.grey,
    onBackground: Colors.grey.shade800,
    surface: Colors.white,
    onSurface: Colors.grey.shade800,
    error: Colors.red,
    onError: Colors.white,
  ),
);

final darkTheme = ThemeData(
  fontFamily: 'Poppins',
  scaffoldBackgroundColor: colorScaffoldBgDark,
  splashColor: colorPrimaryLight.withOpacity(0.1),
  highlightColor: colorPrimaryLight.withOpacity(0.05),
  iconTheme: const IconThemeData(color: colorSecondaryLight),
  listTileTheme: const ListTileThemeData(iconColor: colorSecondaryLight),
  dialogTheme: const DialogTheme(
    backgroundColor: Color(0xff233644),
  ),
  textTheme: TextTheme(
    displayLarge: const TextStyle(color: Colors.grey),
    displayMedium: const TextStyle(color: Colors.grey),
    displaySmall: const TextStyle(color: Colors.grey),
    headlineLarge: TextStyle(color: Colors.grey.shade400),
    headlineMedium: TextStyle(color: Colors.grey.shade400),
    headlineSmall: TextStyle(color: Colors.grey.shade400),
    titleLarge: TextStyle(color: Colors.grey.shade300),
    titleMedium: TextStyle(color: Colors.grey.shade300),
    titleSmall: TextStyle(color: Colors.grey.shade300),
    bodyLarge: TextStyle(color: Colors.grey.shade200),
    bodyMedium: TextStyle(color: Colors.grey.shade200),
    bodySmall: TextStyle(color: Colors.grey.shade200),
    labelLarge: TextStyle(color: Colors.grey.shade100),
    labelMedium: TextStyle(color: Colors.grey.shade100),
    labelSmall: TextStyle(color: Colors.grey.shade100),
  ),
  appBarTheme: const AppBarTheme(
      elevation: 1,
      color: colorBgDark,
      toolbarTextStyle: TextStyle(color: colorSecondaryLight),
      titleTextStyle: TextStyle(color: Colors.grey, fontSize: 18),
      iconTheme: IconThemeData(color: colorSecondaryLight)),
  inputDecorationTheme: InputDecorationTheme(
      border: border,
      errorBorder: border,
      focusedBorder: border,
      focusedErrorBorder: border,
      disabledBorder: border,
      enabledBorder: border,
      filled: true,
      fillColor: colorBgDark),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: colorBgDark,
      selectedIconTheme: const IconThemeData(color: colorSecondaryLight),
      unselectedIconTheme:
          IconThemeData(color: colorSecondaryLight.withOpacity(0.5)),
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedLabelStyle: const TextStyle(color: Colors.grey),
      unselectedLabelStyle: const TextStyle(color: Colors.grey),
      type: BottomNavigationBarType.fixed),
  drawerTheme: const DrawerThemeData(backgroundColor: colorBgDark),
  colorScheme: ColorScheme(
    brightness: Brightness.dark,
    primary: colorPrimaryLight,
    onPrimary: Colors.white,
    secondary: colorSecondaryLight,
    onSecondary: Colors.white,
    background: Colors.grey,
    onBackground: Colors.grey.shade200,
    surface: colorBgDark,
    onSurface: Colors.grey.shade200,
    error: Colors.red,
    onError: Colors.white,
  ),
);
