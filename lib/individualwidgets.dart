// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:social/pages/home.dart';
import 'package:social/pages/register.dart';
import 'package:social/pages/userinfo.dart';
import 'package:social/pages/verification.dart';
import 'package:social/pages/welcome.dart';

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

// Page Route

class Routes {
  static const String welcomePage = "welcome";
  static const String registerPage = "Register";
  static const String verificationPage = "verification";
  static const String userInfoPage = "userInfo";

  static MaterialPageRoute<dynamic> pageRoute(RouteSettings settings) {
    switch (settings.name) {
      case welcomePage:
        return MaterialPageRoute(
          builder: (context) => const WelcomePage(),
        );
      case registerPage:
        return MaterialPageRoute(
          builder: (context) => const RegisterPage(),
        );
      case verificationPage:
        final Map args = settings.arguments as Map;

        return MaterialPageRoute(
          builder: (context) => Verification(
            smsCode: args["smsCode"],
            // phoneNumber: args["phoneNumber"],
          ),
        );
      case userInfoPage:
        return MaterialPageRoute(
          builder: (context) => const UserInfo(),
        );

      default:
        return MaterialPageRoute(builder: (context) => const Home());
    }
  }
}
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

//custome icon

// class MyIcon extends StatelessWidget {
//   final Widget icon;
//   final void Function()? onPressed;
//   final Color? iconColor;

//   const MyIcon({
//     Key? key,
//     this.onPressed,
//     required this.icon,
//     this.iconColor,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return IconButton(
//       onPressed: onPressed,
//       icon: icon,
//       color: iconColor,
//     );
//   }
// }