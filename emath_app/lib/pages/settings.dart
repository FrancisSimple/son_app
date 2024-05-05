import 'package:emath_app/pages/providers.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_switch/flutter_switch.dart';

class UserSettings extends ConsumerStatefulWidget {
  const UserSettings({super.key});

  @override
  ConsumerState<UserSettings> createState() => _UserSettingsState();
}

class _UserSettingsState extends ConsumerState<UserSettings> {
  bool checkState1 = false;
  bool checkState2 = false;
  bool checkState3 = false;
  bool checkState4 = false;

  @override
  Widget build(BuildContext context) {
    String logoLink = ref.watch(logoLinkProvider);

    bool switchState = ref.watch(settingsThemeProvider);

    // bool switchState = false;

    Color? appBarBackground =
        ref.watch(themeProvider.notifier).changeAppBarBackground();
    // Color appBarBackground = Theme.of(context).appBarTheme.backgroundColor

    ThemeNotifier themeController = ref.watch(themeProvider.notifier);
    ThemeIconNotifier themeIconController =
        ref.watch(themeIconProvider.notifier);
    LogoLinkNotifier logoLinkController = ref.watch(logoLinkProvider.notifier);
    SettingsThemeNotifier settingsThemeController =
        ref.watch(settingsThemeProvider.notifier);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: appBarBackground,
          toolbarHeight: 1,
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 10,
            ),

            // Search Bar
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              color: Colors.transparent,
              child: SearchBar(
                hintText: "Search settings",
                leading: const Icon(Icons.search),
                // hintStyle: MaterialStatePropertyAll(TextStyle()),
                // padding: MaterialStatePropertyAll(EdgeInsets.all(10)),
                textInputAction: TextInputAction.go,
                trailing: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_forward_ios),
                    style: const ButtonStyle(
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
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                const SizedBox(
                  height: 10,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    // height: 50,
                    // width: 50,
                    children: [
                      const Text("Theme: "),
                      FlutterSwitch(
                        value: switchState,

                        onToggle: (val) {
                          switchState = val;

                          themeController.changeTheme();
                          themeIconController.changeThemeIcon();
                          logoLinkController.changeLogoLink();
                          settingsThemeController.changeThemeBool();
                          // debugPrint(MediaQuery.of(context)
                          //     .platformBrightness
                          //     .toString());
                        },
                        // inactiveText: "He",
                        inactiveIcon: Icon(
                          Icons.light_mode_outlined,
                          color: Theme.of(context).primaryColorLight,
                        ),
                        activeIcon: Icon(Icons.dark_mode_outlined,
                            color: Colors.deepOrange.shade800),
                        activeColor: Colors.deepOrange.shade800,
                        inactiveColor: Theme.of(context).primaryColorLight,
                      ),
                    ]),
                // Account Section
                Text(
                  "Account",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const Divider(), //Divider
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
                          // const Expanded(
                          //   flex: 2,
                          //   child: CircleAvatar(
                          //     radius: 50,
                          //     child: Center(
                          //       child: Icon(
                          //         Icons.person,
                          //         size: 70,
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          Expanded(
                            flex: 5,
                            child: Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              child: Column(
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // Name
                                  Text(
                                    "User One",
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ),
                                  // SizedBox(
                                  //   height: 10,
                                  // ),
                                  // Username
                                  Text(
                                    "@user101",
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                  // Change Avatar
                                  // Row(
                                  //   children: [
                                  //     const Expanded(
                                  //         flex: 1,
                                  //         child: Text("Change Avatar")),
                                  //     Expanded(
                                  //       flex: 2,
                                  //       child: TextButton.icon(
                                  //           onPressed: () {},
                                  //           icon: const Icon(
                                  //               Icons.file_copy_outlined),
                                  //           label: const Text("Choose Image")),
                                  //     )
                                  //   ],
                                  // ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
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
                          prefixIcon: const Icon(Icons.email_outlined),
                          suffixIcon: IconButton(
                              onPressed: () {}, icon: const Icon(Icons.check)),
                          labelText: "Email",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50)),
                          contentPadding: const EdgeInsets.all(0),
                          prefixIconColor: Colors.orange[900],
                        ),
                      ),

                      const SizedBox(
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
                          prefixIcon: const Icon(Icons.phone_outlined),
                          suffixIcon: IconButton(
                              onPressed: () {}, icon: const Icon(Icons.check)),
                          labelText: "Phone",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50)),
                          contentPadding: const EdgeInsets.all(0),
                          prefixIconColor: Colors.orange[900],
                        ),
                      ),

                      const SizedBox(
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
                              label: const Text("Country"),
                              hintText: "Ghana",
                              // errorText: _errortextSchool,
                              requestFocusOnTap: true,
                              enableFilter: true,
                              inputDecorationTheme: InputDecorationTheme(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50)),
                                prefixIconColor: Colors.orange[900],
                                contentPadding: const EdgeInsets.all(15),
                              ),
                              leadingIcon: const Icon(
                                Icons.map_sharp,
                                // color: Colors.orange[900],
                              ),
                              dropdownMenuEntries: const [
                                DropdownMenuEntry(
                                  value: "Ghana",
                                  label: "Ghana",
                                ),
                                DropdownMenuEntry(
                                    value: "Burkina Faso",
                                    label: "Burkina Faso"),
                                DropdownMenuEntry(
                                    value: "Nigeria", label: "Nigeria"),
                                DropdownMenuEntry(value: "Togo", label: "Togo"),
                                DropdownMenuEntry(
                                    value: "Cote d'Ivoire",
                                    label: "Cote d'Ivoire"),
                                DropdownMenuEntry(
                                    value: "Egypt", label: "Egypt"),
                              ],
                              onSelected: (value) {},
                            ),
                          ),
                          // SizedBox(),
                          IconButton.filledTonal(
                              onPressed: () {}, icon: const Icon(Icons.check))
                        ],
                      ),

                      const SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                ),
                Text(
                  "Notification",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const Divider(),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                    if (checkState1 == true) {
                      setState(() {
                        checkState1 = false;
                      });
                    } else {
                      setState(() {
                        checkState1 = true;
                      });
                    }
                    debugPrint("checkState1: $checkState1");
                  },
                      child: Row(
                        children: [
                          Checkbox(
                              value: checkState1,
                              onChanged: (val) {
                                if (checkState1 == true) {
                                  checkState1 = val!;
                                  setState(() {
                                    checkState1 = false;
                                  });
                                } else {
                                  setState(() {
                                    checkState1 = true;
                                  });
                                }
                              }),
                          const Text("Reminders (Assignments/Quizzes)"),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                    if (checkState2 == true) {
                      setState(() {
                        checkState2 = false;
                      });
                    } else {
                      setState(() {
                        checkState2 = true;
                      });
                    }
                    debugPrint("checkState2: $checkState2");
                  },
                      child: Row(
                        children: [
                          Checkbox(
                              value: checkState2,
                              onChanged: (val) {
                                setState(() {
                                  checkState2 = val!;
                                  debugPrint(checkState2.toString());
                                });
                              }),
                          const Text("Daily Notifications"),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                    if (checkState3 == true) {
                      setState(() {
                        checkState3 = false;
                      });
                    } else {
                      setState(() {
                        checkState3 = true;
                      });
                    }
                    debugPrint("checkState3: $checkState3");
                  },
                      child: Row(
                        children: [
                          Checkbox(
                              value: checkState3,
                              onChanged: (val) {
                                setState(() {
                                  checkState3 = val!;
                                });
                              }),
                          const Text("Email Notifications"),
                        ],
                      ),
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.end,
                    //   children: [
                    //     ElevatedButton(
                    //       onPressed: () {},
                    //       style: const ButtonStyle(
                    //           elevation: MaterialStatePropertyAll(5)),
                    //       child: const Text("Save"),
                    //     ),
                    //     const SizedBox(
                    //       width: 30,
                    //     )
                    //   ],
                    // )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Security",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const Divider(),
                const SizedBox(
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
                    prefixIcon: const Icon(Icons.email_outlined),
                    suffixIcon: IconButton(
                        onPressed: () {}, icon: const Icon(Icons.check)),
                    labelText: "Password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50)),
                    contentPadding: const EdgeInsets.all(0),
                    prefixIconColor: Colors.orange[900],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    if (checkState4 == true) {
                      setState(() {
                        checkState4 = false;
                      });
                    } else {
                      setState(() {
                        checkState4 = true;
                      });
                    }
                    debugPrint("checkState4: $checkState4");
                  },
                  child: Row(
                    children: [
                      Expanded(
                          child: Text(
                        "Two Factor Verification",
                        style: Theme.of(context).textTheme.bodyLarge,
                      )),
                      Checkbox(
                        value: checkState4,
                        // side: BorderSide(style: BorderStyle.solid),
                        onChanged: (val) {
                          setState(() {
                            checkState4 = val!;
                          });
                        },
                        shape: const CircleBorder(eccentricity: 0),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text("Terminate Account"),
                ),

                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Payment",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const Divider(),
                const SizedBox(
                  height: 10,
                ),
                Card(
                  elevation: 10,
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Card",
                          textAlign: TextAlign.left,
                          // style: TextStyle(),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextField(
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            alignLabelWithHint: true,
                            // icon: Icon(Icons.person_rounded),
                            hintText: "Name of account holder",
                            // constraints: BoxConstraints(minHeight: 20),
                            prefixIcon: const Icon(Icons.person_outline),
                            // suffixIcon: IconButton(
                            //     onPressed: () {}, icon: Icon(Icons.check)),
                            labelText: "Account Holder",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50)),
                            contentPadding: const EdgeInsets.all(0),
                            prefixIconColor: Colors.orange[900],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        // Card Number
                        TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            alignLabelWithHint: true,
                            // icon: Icon(Icons.person_rounded),
                            hintText: "Card number",
                            // constraints: BoxConstraints(minHeight: 20),
                            prefixIcon: const Icon(Icons.add_card),
                            // suffixIcon: IconButton(
                            //     onPressed: () {}, icon: Icon(Icons.check)),
                            labelText: "Card Number",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50)),
                            contentPadding: const EdgeInsets.all(0),
                            prefixIconColor: Colors.orange[900],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        // Expiry Date
                        TextField(
                          keyboardType: TextInputType.datetime,
                          decoration: InputDecoration(
                            alignLabelWithHint: true,
                            // icon: Icon(Icons.person_rounded),
                            hintText: "day / month / year",
                            // constraints: BoxConstraints(minHeight: 20),
                            prefixIcon: const Icon(Icons.date_range_outlined),
                            // suffixIcon: IconButton(
                            //     onPressed: () {}, icon: Icon(Icons.check)),
                            labelText: "Expiry Date",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50)),
                            contentPadding: const EdgeInsets.all(0),
                            prefixIconColor: Colors.orange[900],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        // CVV
                        TextField(
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            alignLabelWithHint: true,
                            // icon: Icon(Icons.person_rounded),
                            hintText: "C V V",
                            // constraints: BoxConstraints(minHeight: 20),
                            prefixIcon: const Icon(Icons.account_balance_wallet_outlined),
                            // suffixIcon: IconButton(
                            //     onPressed: () {}, icon: Icon(Icons.check)),
                            labelText: "CVV",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50)),
                            contentPadding: const EdgeInsets.all(0),
                            prefixIconColor: Colors.orange[900],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        // Save Button
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              style: const ButtonStyle(
                                  elevation: MaterialStatePropertyAll(5)),
                              child: const Text("Save"),
                            ),
                            const SizedBox(
                              width: 30,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  "About",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const Divider(),
                // SizedBox(
                //   height: 10,
                // ),
                Image.asset(
                  logoLink,
                  height: 200,
                ),
                Column(
                  children: [
                    const Text("~ V1.1.0"),
                    TextButton(
                      onPressed: () {},
                      child: const Text("scholaropportunitynexus@gmail.com"),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: const ButtonStyle(
                          elevation: MaterialStatePropertyAll(5)),
                      child: const Text("Report an Error"),
                    )
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ))
          ],
        ));
  }
}
