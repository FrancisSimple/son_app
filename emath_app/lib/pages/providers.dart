import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Changing the theme icon
final themeIconProvider =
    StateNotifierProvider<ThemeIconNotifier, IconData>((ref) {
  return ThemeIconNotifier();
});

class ThemeIconNotifier extends StateNotifier<IconData> {
  ThemeIconNotifier() : super(Icons.dark_mode_outlined);

  void changeThemeIcon() {
    if (state == Icons.dark_mode_outlined) {
      state = Icons.light_mode_outlined;
    } else {
      state = Icons.dark_mode_outlined;
    }
  }
}

// Changing logo link
final logoLinkProvider = StateNotifierProvider<LogoLinkNotifier, String>((ref) {
  return LogoLinkNotifier();
});

class LogoLinkNotifier extends StateNotifier<String> {
  LogoLinkNotifier() : super("assets/logo.png");

  void changeLogoLink() {
    if (state == "assets/logo.png") {
      state = "assets/logo_dark.png";
    } else {
      state = "assets/logo.png";
    }
  }
}

// Changing app theme
ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.deepOrange,
    brightness: Brightness.light,
  ),
  useMaterial3: true,
  // brightness: _brightness,
  appBarTheme: const AppBarTheme(
    centerTitle: true,
    backgroundColor: Colors.orange,
  ),
  primaryColorLight: Colors.deepOrange.shade200,
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  // brightness: Brightness.light,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.deepOrange.shade900,
    brightness: Brightness.dark,
  ),
  useMaterial3: true,
  // brightness: _brightness,
  appBarTheme: const AppBarTheme(
    centerTitle: true,
    backgroundColor: Color.fromARGB(255, 57, 20, 3),
  ),
  primaryColorLight: Colors.deepOrange.shade800,
  primaryColorDark: Colors.deepOrange.shade800,
);

final themeProvider = StateNotifierProvider<ThemeNotifier, ThemeData>((ref) {
  return ThemeNotifier();
});

class ThemeNotifier extends StateNotifier<ThemeData> {
  ThemeNotifier() : super(lightTheme);

  void changeTheme() {
    if (state == lightTheme) {
      state = darkTheme;
      debugPrint("Change to dark mode");
    } else {
      state = lightTheme;
      debugPrint("Change to light mode");
    }
  }
}

// Changing Settings Page Theme Toggle
final settingsThemeProvider =
    StateNotifierProvider<SettingsThemeNotifier, bool>((ref) {
  return SettingsThemeNotifier();
});

class SettingsThemeNotifier extends StateNotifier<bool> {
  SettingsThemeNotifier() : super(false);
  void changeThemeBool() {
    if (state == false) {
      state = true;
    } else {
      state = false;
    }
    debugPrint("State: $state");
  }
}
