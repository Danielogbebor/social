import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social/auth.dart';
import 'package:social/pages/register_page.dart';

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
    final ap = Provider.of<AuthProvider>(context, listen: false);

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
                onPressed: () async {
                  if (ap.isSignedIn == true) {
                    await ap.getDataSP().whenComplete(() => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Home(),
                        )));
                  } else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegisterPage(),
                        ));
                  }
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
