import 'package:emath_app/pages/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserSettings extends ConsumerWidget {
  const UserSettings({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    String logoLink = ref.watch(logoLinkProvider);

    ThemeNotifier themeController = ref.watch(themeProvider.notifier);
    ThemeIconNotifier themeIconController = ref.watch(themeIconProvider.notifier);
    LogoLinkNotifier logoLinkController = ref.watch(logoLinkProvider.notifier);
    
    return const Scaffold(
      body: Center(
        child: Text("Settings data will go here.")
      )
    );
  }
}