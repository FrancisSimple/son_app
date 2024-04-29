// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:emath_app/pages/providers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_switch/flutter_switch.dart';

class UserSettings extends ConsumerWidget {
  const UserSettings({super.key});
  static bool switchState = false;
  static bool checkState1 = true;
  static bool checkState2 = true;
  static bool checkState3 = true;
  static bool checkState4 = true;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // String logoLink = ref.watch(logoLinkProvider);
    switchState = ref.watch(settingsThemeProvider);

    ThemeNotifier themeController = ref.watch(themeProvider.notifier);
    ThemeIconNotifier themeIconController =
        ref.watch(themeIconProvider.notifier);
    LogoLinkNotifier logoLinkController = ref.watch(logoLinkProvider.notifier);
    SettingsThemeNotifier settingsThemeController =
        ref.watch(settingsThemeProvider.notifier);

    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          // SizedBox(height: 10,),

          // Search Bar
          Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            color: Colors.transparent,
            child: SearchBar(
              hintText: "Search settings",
              leading: Icon(Icons.search),
              // hintStyle: MaterialStatePropertyAll(TextStyle()),
              // padding: MaterialStatePropertyAll(EdgeInsets.all(10)),
              textInputAction: TextInputAction.go,
              trailing: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.arrow_forward_ios),
                  style: ButtonStyle(
                    // elevation: MaterialStatePropertyAll(40),
                    iconSize: MaterialStatePropertyAll(15),
                    // side: MaterialStatePropertyAll(BorderSide(width: 2)),
                  ),
                )
              ],
            ),
          ),

          // Settings Body
          Expanded(
              child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 20),
            children: [
              SizedBox(
                height: 10,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  // height: 50,
                  // width: 50,
                  children: [
                    Text("Theme: "),
                    FlutterSwitch(
                      value: switchState,
                      activeIcon: Icon(Icons.dark_mode_outlined),
                      inactiveIcon: Icon(Icons.light_mode_outlined),
                      onToggle: (val) {
                        switchState = val;
                        if (switchState == false) {
                          themeController.changeTheme();
                          themeIconController.changeThemeIcon();
                          logoLinkController.changeLogoLink();
                          settingsThemeController.changeThemeBool();
                        } else {
                          themeController.changeTheme();
                          themeIconController.changeThemeIcon();
                          logoLinkController.changeLogoLink();
                          settingsThemeController.changeThemeBool();
                        }
                      },
                      activeColor: Colors.deepOrange.shade800,
                      inactiveColor: Theme.of(context).primaryColorLight,
                    ),
                  ]),
              // Account Section
              Text(
                "Account",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Divider(), //Divider
              SizedBox(
                width: MediaQuery.of(context).size.width,
                // height: 120,
                // width: 200,
                child: Column(
                  children: [
                    // 1st Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Avatar
                        Expanded(
                          flex: 1,
                          child: Container(
                            // margin: EdgeInsets.symmetric(horizontal: 12),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              // color: Theme.of(context).cardColor,
                              color: Color.fromARGB(131, 177, 46, 7),
                            ),
                            padding: EdgeInsets.all(5),

                            child: Center(
                              child: Icon(
                                Icons.person,
                                size: 70,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // Name
                                Text(
                                  "User One",
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                                // SizedBox(
                                //   height: 10,
                                // ),
                                // Username
                                TextField(
                                  decoration: InputDecoration(
                                    // alignLabelWithHint: true,
                                    // icon: Icon(Icons.person_rounded),
                                    hintText: "@user101",
                                    // constraints: BoxConstraints(minHeight: 20),
                                    // prefixIcon: Icon(Icons.email_outlined),
                                    // labelText: "Username",
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.all(0),
                                    prefixIconColor: Colors.orange[900],
                                  ),
                                ),
                                // Change Avatar
                                Row(
                                  children: [
                                    Expanded(
                                        flex: 1, child: Text("Change Avatar")),
                                    Expanded(
                                      flex: 2,
                                      child: TextButton.icon(
                                          onPressed: () {},
                                          icon: Icon(Icons.file_copy_outlined),
                                          label: Text("Choose Image")),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    // Email
                    TextField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        alignLabelWithHint: true,
                        // icon: Icon(Icons.person_rounded),
                        hintText: "user101@gmail.com",
                        // constraints: BoxConstraints(minHeight: 20),
                        prefixIcon: Icon(Icons.email_outlined),
                        suffixIcon: IconButton(
                            onPressed: () {}, icon: Icon(Icons.check)),
                        labelText: "Email",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50)),
                        contentPadding: EdgeInsets.all(0),
                        prefixIconColor: Colors.orange[900],
                      ),
                    ),

                    SizedBox(
                      height: 10,
                    ),
                    // Phone
                    TextField(
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        alignLabelWithHint: true,
                        // icon: Icon(Icons.person_rounded),
                        hintText: "+233 0000000000",
                        // constraints: BoxConstraints(minHeight: 20),
                        prefixIcon: Icon(Icons.phone_outlined),
                        suffixIcon: IconButton(
                            onPressed: () {}, icon: Icon(Icons.check)),
                        labelText: "Phone",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50)),
                        contentPadding: EdgeInsets.all(0),
                        prefixIconColor: Colors.orange[900],
                      ),
                    ),

                    SizedBox(
                      height: 10,
                    ),
                    // Country

                    Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: DropdownMenu(
                            // controller: _schoolController,
                            // width: 250,
                            label: Text("Country"),
                            hintText: "Ghana",
                            // errorText: _errortextSchool,
                            requestFocusOnTap: true,
                            enableFilter: true,
                            inputDecorationTheme: InputDecorationTheme(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50)),
                              prefixIconColor: Colors.orange[900],
                              contentPadding: EdgeInsets.all(15),
                            ),
                            leadingIcon: Icon(
                              Icons.map_sharp,
                              // color: Colors.orange[900],
                            ),
                            dropdownMenuEntries: [
                              DropdownMenuEntry(
                                value: "Ghana",
                                label: "Ghana",
                              ),
                              DropdownMenuEntry(
                                  value: "Burkina Faso", label: "Burkina Faso"),
                              DropdownMenuEntry(
                                  value: "Nigeria", label: "Nigeria"),
                              DropdownMenuEntry(value: "Togo", label: "Togo"),
                              DropdownMenuEntry(
                                  value: "Cote d'Ivoire",
                                  label: "Cote d'Ivoire"),
                              DropdownMenuEntry(value: "Egypt", label: "Egypt"),
                            ],
                            onSelected: (value) {},
                          ),
                        ),
                        // SizedBox(),
                        IconButton.filledTonal(
                            onPressed: () {}, icon: Icon(Icons.check))
                      ],
                    ),

                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
              Text(
                "Notification",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Divider(),
              Column(
                children: [
                  Row(
                    children: [
                      Checkbox(value: checkState1, onChanged: (val) {}),
                      Text("Reminders (Assignments/Quizzes)"),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(value: checkState2, onChanged: (val) {}),
                      Text("Daily Notifications"),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(value: checkState3, onChanged: (val) {}),
                      Text("Email Notifications"),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Security",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Divider(),
              SizedBox(
                height: 10,
              ),
              TextField(
                // keyboardType: TextInputType.,
                obscureText: true,
                decoration: InputDecoration(
                  alignLabelWithHint: true,
                  // icon: Icon(Icons.person_rounded),
                  hintText: ". . . . . . . .",
                  // constraints: BoxConstraints(minHeight: 20),
                  prefixIcon: Icon(Icons.email_outlined),
                  suffixIcon:
                      IconButton(onPressed: () {}, icon: Icon(Icons.check)),
                  labelText: "Password",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50)),
                  contentPadding: EdgeInsets.all(0),
                  prefixIconColor: Colors.orange[900],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                      child: Text(
                    "Two Factor Verification",
                    style: Theme.of(context).textTheme.bodyLarge,
                  )),
                  Checkbox(
                    value: checkState4,
                    // side: BorderSide(style: BorderStyle.solid),
                    onChanged: (val) {},
                    shape: CircleBorder(eccentricity: 0),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ))
        ],
      ),
    ));
  }
}
