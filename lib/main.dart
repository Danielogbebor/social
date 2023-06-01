import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const WelcomePage(),
    );
  }
}

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
            child: Padding(
          padding: const EdgeInsets.all(100.0),
          child: Image.asset("assets/message.png"),
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
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                        text: "Read our ",
                        style: TextStyle(height: 1.5, color: Colors.black),
                        children: [
                          TextSpan(
                              text: "privacy policy,",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 255, 252, 252))),
                          TextSpan(text: "By continuing you agreee with our "),
                          TextSpan(
                              text: "Terms and Condition.",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255)))
                        ])),
              ),
              const SizedBox(
                height: 30,
              ),

              OutlinedButton(
                onPressed: () {
                  if (kDebugMode) {
                    print("continue");
                  }
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
              Material(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(6),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: InkWell(
                    onTap: () {},
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
              )
            ],
          ),
        ),
      ]),
    );
  }
}
