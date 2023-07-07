import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:social/auth.dart';
import 'package:social/individualwidgets.dart';
import 'package:social/pages/social.dart';
import 'package:social/pages/user_info_page.dart';

class Verification extends StatefulWidget {
  final String smsId;
  // final int phoneNumber;
  const Verification({
    super.key,
    required this.smsId,
    // required this.phoneNumber
  });

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  // verify otp function
  void verifyOtp(BuildContext context, String userOtp) {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    ap.verifyOtp(
      BuildContext: context,
      verificationId: widget.smsId,
      userOtp: userOtp,
      onSuccess: () {
        ap.checkForExistingUser().then((value) async {
          if (value == true) {
            ap.getDataFromFirebaseFirestore().then((value) => ap
                .userDataFromSP()
                .then((value) => ap.setSignIn().then((value) => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Social(),
                    )))));
          } else {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const UserInfo(),
                ),
                (route) => false);
          }
        });
      },
    );
  }

  String? otpCode;
  @override
  Widget build(BuildContext context) {
    final isLoading =
        Provider.of<AuthProvider>(context, listen: true).isLoading;
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
        body: Center(
          child: isLoading == true
              ? const Center(
                  child: CircularProgressIndicator(
                    color: Colors.black,
                  ),
                )
              : Column(children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                          text:
                              "Enter the OTP that has been sent to your phone \n ",
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
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(10))),
                      onCompleted: (value) {
                        setState(() {
                          otpCode = value;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text("Enter 6-digits code"),
                  const SizedBox(height: 40),
                  MyButton(
                    text: "Verify",
                    onPressed: () {
                      if (otpCode != null) {
                        verifyOtp(context, otpCode!);
                      } else {
                        showAlertDialog(
                            context: context,
                            message: "Please provide the 6-Digit code");
                      }
                    },
                  ),
                  const SizedBox(height: 40),
                  GestureDetector(
                    onTap: () {
                      print(otpCode);
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
                ]),
        ));
  }
}
