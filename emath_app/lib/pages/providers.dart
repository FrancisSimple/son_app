import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final ThemeProvider = StateNotifierProvider<ThemeNotifier,Brightness>((ref) {
  return ThemeNotifier();
});

class ThemeNotifier extends StateNotifier<Brightness> {
  ThemeNotifier(): super(Brightness.light);

  void changeTheme(){
    if (state == Brightness.light) {
      state = Brightness.dark;
    } else{
      state = Brightness.light;
    }
  }
  
}