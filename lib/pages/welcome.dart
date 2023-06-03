import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../individualwidgets.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({
    super.key,
  });

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Column(children: <Widget>[
        const SizedBox(
          height: 40,
        ),
        Expanded(
            child: Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.all(100.0),
            child: Image.asset("assets/message.png"),
          ),
        )),
        Expanded(
          child: Column(
            children: [
              const Text(
                "Welcome to Social",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2),
              ),
              const SizedBox(height: 10),
              const privacy_policy(),
              const SizedBox(
                height: 30,
              ),

              OutlinedButton(
                onPressed: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      Routes.registerPage, (route) => false);
                },
                child: const Text(
                  "Continue",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2),
                ),
              ),
              // ),
              const SizedBox(
                height: 40,
              ),
              const LanguageSelection()
            ],
          ),
        ),
      ]),
    );
  }
}
