import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:social/individualwidgets.dart';

class Verification extends StatefulWidget {
  final String smsCode;
  // final int phoneNumber;
  const Verification({
    super.key,
    required this.smsCode,
    // required this.phoneNumber
  });

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.grey,
          title: const Text(
            "Verification",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: Column(children: [
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                  text: "Enter the OTP that has been sent to your phone \n ",
                  style: TextStyle(color: Colors.black, height: 1.5),
                  children: [
                    TextSpan(
                        text: "Wrong number?",
                        style: TextStyle(color: Colors.white)),
                  ]),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Pinput(
              keyboardType: TextInputType.number,
              length: 6,
              onChanged: (value) {},
              defaultPinTheme: PinTheme(
                  width: 60,
                  height: 60,
                  textStyle:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(10))),
            ),
          ),
          const SizedBox(height: 20),
          const Text("Enter 6-digits code"),
          const SizedBox(height: 40),
          MyButton(
            text: "Verify",
            onPressed: () {
              print("verify");
            },
          ),
          const SizedBox(height: 40),
          GestureDetector(
            onTap: () {
              print("resend sms");
            },
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.message),
                SizedBox(width: 10),
                Text(
                  "Resend SMS",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 40),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: () {
              print("request a phone call");
            },
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.phone),
                SizedBox(width: 10),
                Text(
                  "Request a call",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          )
        ]));
  }
}
