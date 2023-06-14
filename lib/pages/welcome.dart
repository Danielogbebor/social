import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social/auth.dart';

import '../individualwidgets.dart';
import 'home.dart';

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
    // final ap = Provider.of<AuthProvider>(context, listen: false);

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

              MyButton(
                onPressed: () {
                  Provider.of<AuthProvider>(context, listen: false)
                              .isSignedIn ==
                          true
                      //get sharedpref
                      ? Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const Home()))
                      // : Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => RegisterPage(),
                      //     ));
                      : Navigator.of(context).pushNamedAndRemoveUntil(
                          Routes.registerPage, (route) => false);
                },
                text: "Get started",
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
