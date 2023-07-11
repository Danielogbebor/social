// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_const_constructors
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import 'package:social/pages/calls_page.dart';
import 'package:social/pages/chat_page.dart';
import 'package:social/pages/social.dart';
import 'package:social/pages/settings_page.dart';
import 'package:social/pages/welcome_page.dart';

import 'auth.dart';

// privacy policy
class privacy_policy extends StatelessWidget {
  const privacy_policy({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: RichText(
          textAlign: TextAlign.center,
          text: const TextSpan(
              text: "Read our ",
              style: TextStyle(height: 1.5, color: Colors.black),
              children: [
                TextSpan(
                    text: "privacy policy,",
                    style:
                        TextStyle(color: Color.fromARGB(255, 255, 252, 252))),
                TextSpan(text: "By continuing you agreee with our "),
                TextSpan(
                    text: "Terms and Condition.",
                    style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)))
              ])),
    );
  }
}
// language selection

class LanguageSelection extends StatelessWidget {
  const LanguageSelection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.grey,
      borderRadius: BorderRadius.circular(6),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: InkWell(
          onTap: () {
            showModalBottomSheet(
              backgroundColor: Colors.grey,
              context: context,
              builder: (context) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 214, 214, 214),
                            borderRadius: BorderRadius.circular(10)),
                        height: 10,
                        width: 60,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 10),
                      child: Row(
                        children: [
                          GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: const Icon(Icons.cancel)),
                          const SizedBox(
                            width: 115,
                          ),
                          const Text(
                            "Languages",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                      child: Divider(
                        color: Colors.white,
                      ),
                    ),
                    RadioListTile(
                      activeColor: Colors.black,
                      value: true,
                      groupValue: false,
                      onChanged: (value) {},
                      title: const Text("English"),
                      subtitle: const Text("(Phone Language)"),
                    ),
                    RadioListTile(
                      activeColor: Colors.black,
                      value: true,
                      groupValue: false,
                      onChanged: (value) {},
                      title: const Text("Spanish"),
                      subtitle: const Text("(Phone Language)"),
                    ),
                    RadioListTile(
                      activeColor: Colors.black,
                      value: true,
                      groupValue: false,
                      onChanged: (value) {},
                      title: const Text("Italian"),
                      subtitle: const Text("(Phone Language)"),
                    )
                  ],
                );
              },
            );
          },
          borderRadius: BorderRadius.circular(20),
          // splashFactory: NoSplash.splashFactory,
          highlightColor: Colors.grey,
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.language,
                color: Colors.black,
              ),
              SizedBox(
                width: 5,
              ),
              Text("English"),
              SizedBox(
                width: 5,
              ),
              Icon(
                Icons.keyboard_arrow_down,
                color: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// textfield

class MyTextfield extends StatelessWidget {
  final void Function()? onTap;
  final TextEditingController? controller;
  final bool? readOnly;
  final TextInputType? keyboardType;
  final void Function(String)? onChanged;
  final String? prefixText;
  final Widget? suffixIcon;
  final String? hintText;
  final TextAlign? textAlign;

  final Widget? prefix;
  const MyTextfield({
    Key? key,
    this.onTap,
    this.controller,
    this.readOnly,
    this.keyboardType,
    this.onChanged,
    this.prefixText,
    this.suffixIcon,
    this.hintText,
    required this.textAlign,
    this.prefix,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onTap: onTap,
      controller: controller,
      readOnly: readOnly ?? false,
      keyboardType: keyboardType,
      //
      onChanged: onChanged,
      textAlign: textAlign ?? TextAlign.center,
      decoration: InputDecoration(
          prefixText: prefixText,
          suffixIcon: suffixIcon,
          hintText: hintText,
          prefix: prefix,
          hintStyle: const TextStyle(color: Colors.white),
          isDense: true,
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black))),
    );
  }
}

// alert dialog

showAlertDialog({
  required BuildContext context,
  required String message,
}) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: Colors.grey,
        content: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Text(
            message,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            child: const Text(
              "OK",
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      );
    },
  );
}

// // Page Route

// class Routes {
//   static const String welcomePage = "welcome";
//   static const String registerPage = "Register";
//   static const String verificationPage = "verification";
//   static const String userInfoPage = "userInfo";

//   static MaterialPageRoute<dynamic> pageRoute(RouteSettings settings) {
//     switch (settings.name) {
//       case welcomePage:
//         return MaterialPageRoute(
//           builder: (context) => const WelcomePage(),
//         );
//       case registerPage:
//         return MaterialPageRoute(
//           builder: (context) => const RegisterPage(),
//         );
//       case verificationPage:
//         final Map args = settings.arguments as Map;

//         return MaterialPageRoute(
//           builder: (context) => Verification(
//             smsId: args["smsCode"],
//             // phoneNumber: args["phoneNumber"],
//           ),
//         );
//       case userInfoPage:
//         return MaterialPageRoute(
//           builder: (context) => const UserInfo(),
//         );

//       default:
//         return MaterialPageRoute(builder: (context) => const Home());
//     }
//   }
// }
// show loadingdialog

showLoadingDialog({
  required BuildContext context,
  required String message,
}) async {
  return await showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                const CircularProgressIndicator(color: Colors.greenAccent),
                const SizedBox(width: 20),
                Expanded(
                  child: Text(
                    message,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                      height: 1.5,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}
// custom button

class MyButton extends StatelessWidget {
  final Function()? onPressed;
  String text;
  MyButton({
    Key? key,
    this.onPressed,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            letterSpacing: 2),
      ),
    );
  }
}

//  pickimage function
Future<File?> pickImage(BuildContext context) async {
  File? image;
  try {
    final pickImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickImage != null) {
      image = File(pickImage.path);
    }
  } catch (e) {
    showAlertDialog(context: context, message: e.toString());
  }
  return image;
}

// drawer
class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    // File? image;

    return Drawer(
      backgroundColor: Colors.grey[900],
      child: Column(
        children: [
          // HEADER
          DrawerHeader(
            child: GestureDetector(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                  ap.userModel.profilePhoto,
                ),
              ),
            ),
          ),
          Text(
            (ap.userModel.name),
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            ap.userModel.phoneNumber,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Divider(),
          ),
          // LIST OF PAGES
          MyListTile(
            icon: Icons.home,
            text: 'S O C I A L',
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Social(),
                  ));
            },
          ),
          MyListTile(
            icon: Icons.chat,
            text: 'C H A T S',
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChatPage(
                      receiverPhoneNumber: '',
                      receiverUID: '',
                    ),
                  ));
            },
          ),
          MyListTile(
            icon: Icons.call,
            text: 'C A L L S',
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CallsPage(),
                  ));
            },
          ),
          MyListTile(
            icon: Icons.settings,
            text: 'S E T T I N G S',
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingsPage(),
                  ));
            },
          ),
          SizedBox(
            height: 150,
          ),
          MyListTile(
            icon: Icons.logout,
            text: 'S I G N O U T',
            onTap: () {
              ap.signOut().then((value) => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WelcomePage(),
                  )));
            },
          )
          // LOG OUT
        ],
      ),
    );
  }
}

class MyListTile extends StatelessWidget {
  final String text;
  final IconData icon;
  final void Function()? onTap;
  const MyListTile({
    Key? key,
    required this.text,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final style = TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.bold,
    );
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.white,
        ),
        title: Text(text, style: style),
        onTap: onTap,
      ),
    );
  }
}

// // drawer menu
// class HiddenDrawer extends StatefulWidget {
//   const HiddenDrawer({super.key});

//   @override
//   State<HiddenDrawer> createState() => _HiddenDrawerState();
// }

// class _HiddenDrawerState extends State<HiddenDrawer> {
//   List<ScreenHiddenDrawer> _pages = [];
//   final myBaseStyle =
//       TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white);
//   final mySelectedStyle =
//       TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white);
//   @override
//   void initState() {
//     _pages = [
//       ScreenHiddenDrawer(
//         ItemHiddenMenu(
//             name: "Social",
//             baseStyle: myBaseStyle,
//             selectedStyle: mySelectedStyle,
//             colorLineSelected: Colors.white),
//         Home(),
//       ),
//       ScreenHiddenDrawer(
//         ItemHiddenMenu(
//             name: "Chats",
//             baseStyle: myBaseStyle,
//             selectedStyle: mySelectedStyle,
//             colorLineSelected: Colors.white),
//         ChatPage(),
//       ),
//       ScreenHiddenDrawer(
//         ItemHiddenMenu(
//             name: "Calls",
//             baseStyle: myBaseStyle,
//             selectedStyle: mySelectedStyle,
//             colorLineSelected: Colors.white),
//         CallsPage(),
//       ),
//       ScreenHiddenDrawer(
//         ItemHiddenMenu(
//             name: "Settings",
//             baseStyle: myBaseStyle,
//             selectedStyle: mySelectedStyle,
//             colorLineSelected: Colors.white),
//         SettingsPage(),
//       ),
//     ];
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return HiddenDrawerMenu(
//       backgroundColorMenu: Colors.grey.shade600,
//       screens: _pages,
//       initPositionSelected: 0,
//       backgroundColorAppBar: Colors.grey,
//       slidePercent: 50,
//       contentCornerRadius: 40,
//       curveAnimation: Curves.bounceIn,
//     );
//   }
// }

// // drawer default
