import 'package:flutter/material.dart';
import 'package:social/individualwidgets.dart';
import 'package:social/pages/register.dart';

class Verification extends StatefulWidget {
  const Verification({super.key});

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  late final TextEditingController codeController;
  @override
  void initState() {
    codeController = TextEditingController();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    codeController = TextEditingController();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.grey,
          title: const Text(
            "Verify your number",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          actions: [
            MyIcon(
              onPressed: () {
                print("object");
              },
              iconColor: Colors.black,
              icon: const Icon(Icons.more_vert),
            ),
          ],
        ),
        body: Column(children: [
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                  text:
                      "Your verification code has been sent to +447534428807. Wait for a minute before requesting another sms or call with code. ",
                  style: TextStyle(color: Colors.black, height: 1.5),
                  children: [
                    TextSpan(
                        text: "Wrong number?",
                        style: TextStyle(color: Colors.white)),
                  ]),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 80, left: 80),
            child: MyTextfield(
              textAlign: TextAlign.center,
              controller: codeController,
              hintText: "-  -  -   -  -  -",
              keyboardType: TextInputType.number,
            ),
          ),
          SizedBox(height: 10),
          Text("Enter 6-digits code"),
          SizedBox(height: 40),
          GestureDetector(
            onTap: () {
              print("resend sms");
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.message),
                SizedBox(width: 10),
                Text("Resend SMS"),
                SizedBox(height: 40),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: () {
              print("request a phone call");
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.phone),
                SizedBox(width: 10),
                Text("Request a call"),
              ],
            ),
          )
        ]));
  }
}
