import 'package:flutter/material.dart';
import 'package:quick_chat/gen/fonts.gen.dart';

class AppColors {
  // Singleton implementation (optional, if needed elsewhere)
  // static final AppColors _instance = AppColors._internal();
  // factory AppColors() => _instance;
  // AppColors._internal();

  // Static theme mode variable
  static bool isDarkMode = true;

  // Static color definitions
  static const Color blue = Color(0xFF002DE3);
  static const Color red = Color.fromARGB(255, 255, 0, 0);
  // static const Color gery = Colors.grey;

  // Background color depending on dark mode
  static Color get blackWhite =>
      isDarkMode ? Colors.grey.shade900 : Colors.white;

  static Color get whiteBlack =>
      isDarkMode ? Colors.white : Colors.grey.shade900;
  static Color get grey =>
      isDarkMode ? Colors.grey.shade500 : Colors.grey.shade700;
  // static final ThemeData lightTheme = ThemeData(
  //   brightness: Brightness.light,
  //   primaryColor: Color(0xFF002DE3),
  //   colorScheme: ColorScheme(
  //       brightness: brightness,
  //       primary: primary,
  //       onPrimary: onPrimary,
  //       secondary: secondary,
  //       onSecondary: onSecondary,
  //       error: error,
  //       onError: onError,
  //       surface: surface,
  //       onSurface: onSurface),
  //   appBarTheme: const AppBarTheme(
  //     color: Colors.white,
  //   ),
  //   //make the color of selection color to be green and change the color of handle
  //   textSelectionTheme: TextSelectionThemeData(
  //     selectionColor: ColorName.green.withOpacity(0.5),
  //     selectionHandleColor: ColorName.green,
  //   ),
  //   fontFamily: FontFamily.alexandria,
  //   useMaterial3: true,
  //   scaffoldBackgroundColor: Colors.white,
  // );

  // static final ThemeData dartTheme = ThemeData(
  //   brightness: Brightness.dark,
  //   primaryColor: Color(0xFF002DE3),
  //   scaffoldBackgroundColor: Colors.white12,
  // );

  // static ThemeData get theme => isDarkMode ? dartTheme : lightTheme;
}
