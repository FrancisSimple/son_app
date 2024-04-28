// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:emath_app/pages/login.dart';
import 'package:emath_app/pages/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});
  static IconData themeIcon = Icons.dark_mode_outlined;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    navToLogin() {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const LoginPage()));
    }

    navToSignup() {
      Navigator.pushReplacementNamed(context, '/signuppage');
    }

    String logoLink = ref.watch(logoLinkProvider);

    ThemeNotifier themeController = ref.watch(themeProvider.notifier);
    ThemeIconNotifier themeIconController = ref.watch(themeIconProvider.notifier);
    LogoLinkNotifier logoLinkController = ref.watch(logoLinkProvider.notifier);
    return Scaffold(
      body: Container(
        // alignment: Alignment.center,
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: [
                  Image.asset(
                    logoLink,
                    height: 250,
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 50),
                      child: Text(
                        "Get Started",
                        style: TextStyle(
                          fontSize: 30,
                          // color: Colors.orange[900],
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      height: 200,
                      margin: EdgeInsets.only(bottom: 100),
                      // decoration: BoxDecoration(
                      //   color: Colors.orange[100],
                      // ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                            onPressed: navToLogin,
                            child: Text(
                              "Login",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          Center(
                            child: Text(
                              "Or",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: navToSignup,
                            child: Text(
                              "Sign Up",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.bottomRight,
              color: Colors.transparent,
              child: FloatingActionButton(
                onPressed: () {
                  themeController.changeTheme();
                  themeIconController.changeThemeIcon();
                  logoLinkController.changeLogoLink();
                },
                shape: CircleBorder(),
                child: Icon(ref.watch(themeIconProvider)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
