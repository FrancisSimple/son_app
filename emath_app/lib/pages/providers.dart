import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Changing the theme icon
final themeIconProvider = StateNotifierProvider<ThemeIconNotifier, IconData>((ref) {
  return ThemeIconNotifier();
});

class ThemeIconNotifier extends StateNotifier<IconData> {
  ThemeIconNotifier(): super(Icons.dark_mode_outlined);

  void changeThemeIcon(){
    if (state == Icons.dark_mode_outlined) {
      state = Icons.light_mode_outlined;
    }
    else{
      state = Icons.dark_mode_outlined;
    }
  }
  
}

// Changing logo link
final logoLinkProvider = StateNotifierProvider<LogoLinkNotifier ,String>((ref) {
  return LogoLinkNotifier();
});

class LogoLinkNotifier extends StateNotifier<String> {
  LogoLinkNotifier(): super("assets/logo.png");

  void changeLogoLink() {
    if (state == "assets/logo.png") {
      state = "assets/logo_dark.png";
    }else{
      state = "assets/logo.png";
    }
  }
  
}

// Changing app theme
final themeProvider = StateNotifierProvider<ThemeNotifier,Brightness>((ref) {
  return ThemeNotifier();
});

class ThemeNotifier extends StateNotifier<Brightness> {
  ThemeNotifier(): super(Brightness.light);

  void changeTheme(){
    if (state == Brightness.light) {
      state = Brightness.dark;
      debugPrint("Change to dark mode");
    } else{
      state = Brightness.light;
      debugPrint("Change to dark mode");
    }
  }
  
}