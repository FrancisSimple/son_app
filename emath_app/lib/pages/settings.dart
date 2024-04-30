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
  static bool checkState4 = false;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String logoLink = ref.watch(logoLinkProvider);
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

                      onToggle: (val) {
                        switchState = val;

                        settingsThemeController.changeThemeBool();
                        themeController.changeTheme();
                        themeIconController.changeThemeIcon();
                        logoLinkController.changeLogoLink();
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
                                  keyboardType: TextInputType.name,
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
                    onChanged: (val) {
                      checkState4 = val!;

                      if (checkState4 == true) {
                        checkState4 = false;
                      } else {
                        checkState4 = true;
                      }
                    },
                    shape: CircleBorder(eccentricity: 0),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              TextButton(
                onPressed: () {},
                child: Text("Terminate Account"),
              ),

              SizedBox(
                height: 20,
              ),
              Text(
                "Payment",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Divider(),
              SizedBox(
                height: 10,
              ),
              Card(
                elevation: 10,
                child: Container(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Card",
                        textAlign: TextAlign.left,
                        // style: TextStyle(),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      TextField(
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          alignLabelWithHint: true,
                          // icon: Icon(Icons.person_rounded),
                          hintText: "Name of account holder",
                          // constraints: BoxConstraints(minHeight: 20),
                          prefixIcon: Icon(Icons.person_outline),
                          // suffixIcon: IconButton(
                          //     onPressed: () {}, icon: Icon(Icons.check)),
                          labelText: "Account Holder",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50)),
                          contentPadding: EdgeInsets.all(0),
                          prefixIconColor: Colors.orange[900],
                        ),
                      ),
                      SizedBox(
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
                          prefixIcon: Icon(Icons.add_card),
                          // suffixIcon: IconButton(
                          //     onPressed: () {}, icon: Icon(Icons.check)),
                          labelText: "Card Number",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50)),
                          contentPadding: EdgeInsets.all(0),
                          prefixIconColor: Colors.orange[900],
                        ),
                      ),
                      SizedBox(
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
                          prefixIcon: Icon(Icons.date_range_outlined),
                          // suffixIcon: IconButton(
                          //     onPressed: () {}, icon: Icon(Icons.check)),
                          labelText: "Expiry Date",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50)),
                          contentPadding: EdgeInsets.all(0),
                          prefixIconColor: Colors.orange[900],
                        ),
                      ),
                      SizedBox(
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
                          prefixIcon: Icon(Icons.date_range_outlined),
                          // suffixIcon: IconButton(
                          //     onPressed: () {}, icon: Icon(Icons.check)),
                          labelText: "CVV",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50)),
                          contentPadding: EdgeInsets.all(0),
                          prefixIconColor: Colors.orange[900],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      // Save Button
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(onPressed: () {}, child: Text("Save")),
                          SizedBox(width: 30,)
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "About",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Divider(),
              // SizedBox(
              //   height: 10,
              // ),
              Image.asset(
                logoLink,
                height: 200,
              ),
              Column(
                children: [
                  Text("~ V1.1.0"),
                  TextButton(
                    onPressed: () {},
                    child: Text("scholaropportunitynexus@gmail.com"),
                  ),
                  SizedBox(height: 10,),
                  ElevatedButton(onPressed: (){}, child: Text("Report an Error"))
                ],
              ),
              SizedBox(
                height: 50,
              ),
            ],
          ))
        ],
      ),
    ));
  }
}
